xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://com.ztesoft.zsmart/xsd";
(:: import schema at "../Specifications/CrmWebServicesWhale.wsdl" ::)
declare namespace ns1="http://ussd.operaciones.wom.ws.ncl.com";
(:: import schema at "../Specifications/USSDOperaciones.xsd" ::)

declare variable $input as element() (:: schema-element(ns1:ussdOperacion) ::) external;

declare function local:func($input as element() (:: schema-element(ns1:ussdOperacion) ::)) as element() (:: schema-element(ns2:DebitAcntRequest) ::) {
    <ns2:DebitAcntRequest>
        <TransactionID>
          {
            let $fecha := replace(replace(replace(substring(xs:string(fn:current-dateTime()),1,19),'T',':'),':',''),'-','')
            let $UGW := 'UGW'
            let $sequence := '000'            
            return concat($UGW,$fecha,$sequence)            
          }
        </TransactionID>
        <ServiceNumber>{fn:data($input/nroCelular)}</ServiceNumber>
    </ns2:DebitAcntRequest>
};

local:func($input)
