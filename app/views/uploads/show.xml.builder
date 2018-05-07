xml.instruct!(:xml, :version => "1.0", :encoding => "UTF-8")
xml.dsXmlSummary("xmlns" => "http://www.tempuri.org/dsXmlSummary.xsd") do
  xml.tag!('xs:schema', {"id" => "dsXmlSummary", "targetNamespace" => "http://www.tempuri.org/dsXmlSummary.xsd",
                 "xmlns:mstns" => "http://www.tempuri.org/dsXmlSummary.xsd",
                 "xmlns" => "http://www.tempuri.org/dsXmlSummary.xsd",
                 "xmlns:xs" => "http://www.w3.org/2001/XMLSchema",
                 "xmlns:msdata" => "urn: schemas-microsoft-com:xml-msdata",
                 "attributeFormDefault" => "qualified",
                 "elementFormDefault" => "qualified"}) do
    xml.tag!("xs:element", {"name" => "dsXmlSummary", "msdata:IsDataSet" => "true"}) do
      xml.tag!("xs:complexType") do
        xml.tag!("xs:choice", {"maxOccurs" => "unbounded"}) do
          xml.tag!("xs:element", {"name" => "admin_reports_xmlReports"}) do
            xml.tag!("xs:complexType") do
              xml.tag!("xs:sequence") do
                xml.tag!("xs:element", {"name" => "emailAddress", "type" => "xs:string", "minOccurs" => "0"})
                xml.tag!("xs:element", {"name" => "licenseType", "type" => "xs:string", "minOccurs" => "0"})
                xml.tag!("xs:element", {"name" => "stateIssued", "type" => "xs:string", "minOccurs" => "0"})
                xml.tag!("xs:element", {"name" => "licenseNo", "type" => "xs:string", "minOccurs" => "0"})
                xml.tag!("xs:element", {"name" => "expiration", "type" => "xs:string", "minOccurs" => "0"})
                xml.tag!("xs:element", {"name" => "dateOfCompletion", "type" => "xs:string", "minOccurs" => "0"})
                xml.tag!("xs:element", {"name" => "provider", "type" => "xs:string", "minOccurs" => "0"})
                xml.tag!("xs:element", {"name" => "city", "type" => "xs:string", "minOccurs" => "0"})
                xml.tag!("xs:element", {"name" => "nameLast", "type" => "xs:string", "minOccurs" => "0"})
                xml.tag!("xs:element", {"name" => "nameFirst", "type" => "xs:string", "minOccurs" => "0"})
                xml.tag!("xs:element", {"name" => "nameMiddle", "type" => "xs:string", "minOccurs" => "0"})
                xml.tag!("xs:element", {"name" => "street", "type" => "xs:string", "minOccurs" => "0"})
                xml.tag!("xs:element", {"name" => "nremtReReg", "type" => "xs:string", "minOccurs" => "0"})
                xml.tag!("xs:element", {"name" => "state", "type" => "xs:string", "minOccurs" => "0"})
                xml.tag!("xs:element", {"name" => "zip", "type" => "xs:string", "minOccurs" => "0"})
                xml.tag!("xs:element", {"name" => "nremtNo", "type" => "xs:string", "minOccurs" => "0"})
                xml.tag!("xs:element", {"name" => "phone", "type" => "xs:string", "minOccurs" => "0"})
                xml.tag!("xs:element", {"name" => "courseNo", "type" => "xs:string", "minOccurs" => "0"})
                xml.tag!("xs:element", {"name" => "units", "type" => "xs:string", "minOccurs" => "0"})
                xml.tag!("xs:element", {"name" => "Type", "type" => "xs:string", "minOccurs" => "0"})
              end
            end
          end
        end
      end
    end
  end
  @worksheet.each do |row|
    xml.admin_reports_xmlReports do
      xml.emailAddress(row && row.cells[7].value)
      xml.licenseType(row && row.cells[15].value)
      xml.stateIssued(row && row.cells[14].value)
      xml.licenseNo(row && row.cells[13].value)
      xml.expiration(row && row.cells[16].value.is_a?(DateTime) ? row.cells[16].value.strftime("%m/%d/%Y") : row.cells[16].value)
      xml.dateOfCompletion(row && row.cells[8].value.is_a?(DateTime) ? row.cells[8].value.strftime("%m/%d/%Y") : row.cells[8].value)
      xml.provider(row && row.cells[12].value)
      xml.city(row && row.cells[4].value)
      xml.nameLast(row && row.cells[0].value)
      xml.nameFirst(row && row.cells[1].value)
      xml.nameMiddle(row && row.cells[2].value)
      xml.street(row && row.cells[3].value)
      xml.nremtReReg(row && row.cells[18].value.is_a?(DateTime) ? row.cells[18].value.strftime("%m/%d/%Y") : row.cells[18].value)
      xml.state(row && row.cells[5].value)
      xml.zip(row && row.cells[6].value)
      xml.nremtNo(row && row.cells[17].value)
      xml.phone(row && row.cells[9].value)
      xml.courseNo(row && row.cells[10].value)
      xml.units(row && row.cells[11].value)
      xml.Type(row && row.cells[19].value)
    end
  end
end
