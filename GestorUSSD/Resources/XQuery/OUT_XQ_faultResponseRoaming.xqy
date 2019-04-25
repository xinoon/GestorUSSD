xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:ussdOperacionResponse" location="../WSDL/USSDOperaciones.xsd" ::)

declare namespace ns0 = "http://ussd.operaciones.wom.ws.ncl.com";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/OUT_XQ_faultResponseRoaming/";

declare function xf:OUT_XQ_faultResponseRoaming($faultcode as xs:string,
    $faultstring as xs:string)
    as element(ns0:ussdOperacionResponse) {
        <ns0:ussdOperacionResponse>
            <errorCode>{ $faultstring }</errorCode>
            <errorDescription>{ 
				if(contains(upper-case($faultcode),'SALDO')) then 
					('Buu :(, Tu saldo es insuficiente para realizar la compra.') 
				else (
					'Mala noticia, tu bolsa no ha sido activada, por favor prueba nuevamente.'
				)
			 }</errorDescription>
        </ns0:ussdOperacionResponse>
};

declare variable $faultcode as xs:string external;
declare variable $faultstring as xs:string external;

xf:OUT_XQ_faultResponseRoaming($faultcode,
    $faultstring)