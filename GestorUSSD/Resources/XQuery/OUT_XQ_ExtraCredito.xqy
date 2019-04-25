xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$suscribeExtraCreditoResponse" element="ns0:SuscribeExtraCreditoResponse" location="../WSDL/PSSuscribeExtraCredito.xsd" ::)
(:: pragma  type="anyType" ::)

declare namespace ns0 = "http://operaciones.extracredito.wom.ws.ncl.com";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/OUT_XQ_ExtraCredito/";

declare function xf:OUT_XQ_ExtraCredito($suscribeExtraCreditoResponse as element(ns0:SuscribeExtraCreditoResponse))
    as element(*) {
        <respuestaExtraCredito>
                    <errorCode>{$suscribeExtraCreditoResponse/errorCode/text()}</errorCode>
                    <errorDescription>{$suscribeExtraCreditoResponse/errorDescription/text()}</errorDescription>                    
        </respuestaExtraCredito>
};

declare variable $suscribeExtraCreditoResponse as element(ns0:SuscribeExtraCreditoResponse) external;

xf:OUT_XQ_ExtraCredito($suscribeExtraCreditoResponse)