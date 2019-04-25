xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$consultaExtraCreditoResponse" element="ns0:consultaExtraCreditoResponse" location="../WSDL/ConsultaExtraSaldo.xsd" ::)
(:: pragma  type="anyType" ::)

declare namespace ns0 = "http://operaciones.extracredito.wom.ws.ncl.com/ConsultaExtraSaldo";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/OUT_XQ_ConsultaExtraSaldo/";

declare function xf:OUT_XQ_ConsultaExtraSaldo($consultaExtraCreditoResponse as element(ns0:consultaExtraCreditoResponse))
    as element(*) {
        <consultaExtraSaldo>
        	<saldoPendiente>{$consultaExtraCreditoResponse/ns0:detalleConsulta/ns0:saldoPendiente/text()}</saldoPendiente>
        </consultaExtraSaldo>	
};

declare variable $consultaExtraCreditoResponse as element(ns0:consultaExtraCreditoResponse) external;

xf:OUT_XQ_ConsultaExtraSaldo($consultaExtraCreditoResponse)