xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$setNextelActiveProductResponse1" element="ns0:setNextelActiveProductResponse" location="../../../PortalCautivo/Resources/WSDLs/CaptivePortalService_schema1.xsd" ::)
(:: pragma bea:global-element-return element="ns1:ussdOperacionResponse" location="../WSDL/USSDOperaciones.xsd" ::)

declare namespace ns1 = "http://ussd.operaciones.wom.ws.ncl.com";
declare namespace ns0 = "http://captive.portal.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/OUT_XQ_NextelActiveProduct/";

declare function xf:OUT_XQ_NextelActiveProduct($setNextelActiveProductResponse1 as element(ns0:setNextelActiveProductResponse))
    as element(ns1:ussdOperacionResponse) {
        <ns1:ussdOperacionResponse>
            <errorCode>{ $setNextelActiveProductResponse1/error_code/text() }</errorCode>
            <errorDescription>{ if(contains(upper-case($setNextelActiveProductResponse1/err_description/text()),'SALDO')) then 
								('Buu :(, Tu saldo es insuficiente para realizar la compra.') 
								else (
   									if(contains(upper-case($setNextelActiveProductResponse1/err_description/text()),'SUBSCRIBED')) then 
										('Lo sentimos. Has alcanzado el limite de veces que puedes comprar esta bolsa.') 
   										else 
											(if(contains(upper-case($setNextelActiveProductResponse1/error_code/text()),'5051')) then 
												($setNextelActiveProductResponse1/err_description/text()) 
		   										else 
													('Mala noticia, tu bolsa no ha sido activada, por favor prueba nuevamente.')
											)
   								) 
			}</errorDescription>
        </ns1:ussdOperacionResponse>
};

declare variable $setNextelActiveProductResponse1 as element(ns0:setNextelActiveProductResponse) external;

xf:OUT_XQ_NextelActiveProduct($setNextelActiveProductResponse1)