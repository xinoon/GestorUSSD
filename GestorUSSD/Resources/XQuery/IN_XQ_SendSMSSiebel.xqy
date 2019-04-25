xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:SendSMSRequest" location="../WSDL/SMSSiebel.xsd" ::)

declare namespace ns0 = "http://nii.com/EnterpriseProxyService/ServiceManagement/SendSMSCDMXSD/v1";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/IN_XQ_SendSMSSiebel/";

declare function xf:IN_XQ_SendSMSSiebel($nroCelular as xs:string,
    $mensaje as xs:string)
    as element(ns0:SendSMSRequest) {
        <ns0:SendSMSRequest>
            <destination>{ $nroCelular }</destination>
            <senderName>WOM</senderName>
             <message>
            {                      
              let $fecha_inicio := substring(xs:string(xs:dateTime(fn:current-dateTime())),1,10)
              let $fecha_termino := substring(xs:string(xs:dateTime(fn:current-dateTime()+ xdt:dayTimeDuration("PT120H"))),1,10)
              let $mensaje1 := replace($mensaje,'#1',$fecha_inicio)
              let $mensaje2 := replace($mensaje1,'#2',$fecha_termino)
              return $mensaje2
            }</message>
        </ns0:SendSMSRequest>
};

declare variable $nroCelular as xs:string external;
declare variable $mensaje as xs:string external;

xf:IN_XQ_SendSMSSiebel($nroCelular,
    $mensaje)