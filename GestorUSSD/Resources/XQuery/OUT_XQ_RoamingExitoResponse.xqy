xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:ussdOperacionResponse" location="../WSDL/USSDOperaciones.xsd" ::)

declare namespace ns0 = "http://ussd.operaciones.wom.ws.ncl.com";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/OUT_XQ_RoamingExitoResponse/";

declare function xf:OUT_XQ_RoamingExitoResponse($status as xs:string,
    $description as xs:string)
    as element(ns0:ussdOperacionResponse) {
        <ns0:ussdOperacionResponse>
            <errorCode>{
            	if($status='00')
            	then('200')
            	else('error de sistema. contacte al administrador')}</errorCode>
            <errorDescription>{  
                if($status='00')
            	then('Felicidades su bolsa ha sido activada :D.')
            	else($description)
            }</errorDescription>
        </ns0:ussdOperacionResponse>
};

declare variable $status as xs:string external;
declare variable $description as xs:string external;

xf:OUT_XQ_RoamingExitoResponse($status,
    $description)