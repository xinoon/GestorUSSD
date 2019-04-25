xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getMensajeSmsProductoOutputCollection1" element="ns1:getMensajeSmsProductoOutputCollection" location="../WSDLs/getMensajeSmsProducto.xsd" ::)
(:: pragma bea:global-element-return element="ns0:SendSMSRequest" location="../WSDLs/XMLSchema_1447687381.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/getMensajeSmsProducto";
declare namespace ns0 = "http://nii.com/EnterpriseProxyService/ServiceManagement/SendSMSCDMXSD/v1";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_SendSMSSiebel/";

declare function xf:IN_XQ_SendSMSSiebel($getMensajeSmsProductoOutputCollection1 as element(ns1:getMensajeSmsProductoOutputCollection),
    $nroCelular as xs:string,
    $producto as xs:string)
    as element(ns0:SendSMSRequest) {
        <ns0:SendSMSRequest>
            <destination>{ $nroCelular }</destination>
            <senderName>WOM</senderName>
            <message>{ 
            if(empty($getMensajeSmsProductoOutputCollection1))then
           		(concat('Gracias por tu compra. Tienes una bolsa ',$producto,'. Consulta tu saldo en www.wom.cl o llamando al 103.'))
	           else
	           	(
	           	if(empty($getMensajeSmsProductoOutputCollection1/ns1:getMensajeSmsProductoOutput)) then
	           	(concat('Gracias por tu compra. Tienes una bolsa ',$producto,'. Consulta tu saldo en www.wom.cl o llamando al 103.'))
	           		else
		           	(
			           	if(empty(data($getMensajeSmsProductoOutputCollection1/ns1:getMensajeSmsProductoOutput[1]/ns1:MENSAJE))) then
			           	(concat('Gracias por tu compra. Tienes una bolsa ',$producto,'. Consulta tu saldo en www.wom.cl o llamando al 103.'))
			           	else
			           	(
			           	data($getMensajeSmsProductoOutputCollection1/ns1:getMensajeSmsProductoOutput[1]/ns1:MENSAJE) 
			           	)
		           	)
	           	)
            
            }</message>
        </ns0:SendSMSRequest>
};

declare variable $getMensajeSmsProductoOutputCollection1 as element(ns1:getMensajeSmsProductoOutputCollection) external;
declare variable $nroCelular as xs:string external;
declare variable $producto as xs:string external;


xf:IN_XQ_SendSMSSiebel($getMensajeSmsProductoOutputCollection1,
    $nroCelular,
    $producto)