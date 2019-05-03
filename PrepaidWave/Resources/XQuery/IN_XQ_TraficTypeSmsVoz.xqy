xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../../../ConsultaTrafico/TrafficType/Resources/WSDL/xsd/CTODS_SERVICESAPL_GETTRAFFICDETAIL_3.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/CTODS/SERVICESAPL/GETTRAFFICDETAIL/";
declare namespace xf = "http://tempuri.org/PrepaidWave/Resources/XQuery/IN_XQ_TraficTypeSmsVoz/";

declare function xf:IN_XQ_TraficTypeSmsVoz($startDate as xs:dateTime,
    $endDate as xs:dateTime,
    $nroCelular as xs:string,
    $tipoTrafico as xs:string)
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:I_CELLNUM>{ $nroCelular }</ns0:I_CELLNUM>
            <ns0:I_INICIO>{ $startDate }</ns0:I_INICIO>
            <ns0:I_FIN>{ $endDate }</ns0:I_FIN>
            <ns0:I_TYPESERVICE>{ $tipoTrafico }</ns0:I_TYPESERVICE>
        </ns0:InputParameters>
};

declare variable $startDate as xs:dateTime external;
declare variable $endDate as xs:dateTime external;
declare variable $nroCelular as xs:string external;
declare variable $tipoTrafico as xs:string external;

xf:IN_XQ_TraficTypeSmsVoz($startDate,
    $endDate,
    $nroCelular,
    $tipoTrafico)