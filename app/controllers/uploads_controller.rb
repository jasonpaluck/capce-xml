class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

  def index
    @uploads = Upload.order(created_at: :desc).page params[:page]
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    @upload.user = current_user
    if @upload.save
      redirect_to uploads_url, notice: 'Upload was successfully created.'
    else
      render :new
    end
  end

  def show
    excel_stream = S3_BUCKET.object(@upload.upload_url)
    workbook = RubyXL::Parser.parse_buffer(excel_stream.get.body)
    worksheet = workbook[0]
    header_row = worksheet.sheet_data[0]
    excel_columns = []
    header_row.cells.each { |cell|
      val = cell && cell.value
      excel_columns << val
    }
    worksheet.delete_row(0)
    @worksheet = worksheet
    @excel_columns = excel_columns.compact
    @valid = @excel_columns == Upload::EXCEL_COLUMNS
    respond_to do |format|
      format.xml do
        stream = render_to_string(template: 'uploads/show')
        send_data stream, type: "text/xml"
      end
    end
  end

  def destroy
    @upload.destroy
    redirect_to uploads_url, notice: 'Upload was successfully destroyed.'
  end

  private

    def set_s3_direct_post
      @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201')
    end

    def set_upload
      @upload = Upload.find(params[:id])
    end

    def upload_params
      params.require(:upload).permit(:upload_url)
    end
end
