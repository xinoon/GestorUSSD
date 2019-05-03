xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getPromosAplicadasResponse1" element="ns1:getPromosAplicadasResponse" location="../../../BenePro/Resources/WSDLs/BSCuentaContrato.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$bolsasCompraPromoLinea1" element="ns2:bolsasCompraPromoLinea" location="../WSDL/PrepaidWaveService.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../WSDL/PROVI_BOLS_NII_QUERY_PREPAID_WAVE_PKG_GET_INF_PROMO_COMPRA_BOLSA_PRC.xsd" ::)

declare namespace ns2 = "http://prepaid.wave.ws.ncl.nii.com";
declare namespace ns1 = "http://ccontrato.ws.srv.promo.wom.smartdici/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_QUERY_PREPAID_WAVE_PKG/GET_INF_PROMO_COMPRA_BOLSA_PRC/";
declare namespace xf = "http://tempuri.org/PrepaidWave/Resources/XQuery/IN_XQ_bolsaVigHistReq/";

declare function xf:IN_XQ_bolsaVigHistReq($getPromosAplicadasResponse1 as element(ns1:getPromosAplicadasResponse),
    $bolsasCompraPromoLinea1 as element(ns2:bolsasCompraPromoLinea))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:PV_PHONE_NUMBER>{ data($bolsasCompraPromoLinea1/nroCelular) }</ns0:PV_PHONE_NUMBER>
            <ns0:PV_SEGMENTO>{ data($bolsasCompraPromoLinea1/segmento) }</ns0:PV_SEGMENTO>
            <ns0:PV_TIP_BOLSA>{ data($bolsasCompraPromoLinea1/tipoBolsas) }</ns0:PV_TIP_BOLSA>
            <ns0:PV_ESTADO>{ data($bolsasCompraPromoLinea1/estado) }</ns0:PV_ESTADO>
            <ns0:PV_PRODUCT_PROM>
                {
                   if(not(empty($getPromosAplicadasResponse1/return))) then
                   
	                   if(count($getPromosAplicadasResponse1/return) > 0) then
	                   
	                    for $return in $getPromosAplicadasResponse1/return
	                    return
	                        <ns0:PV_PRODUCT_PROM_ITEM>
	                            {
	                                for $nombre in $return/nombre
	                                return
	                                    <ns0:ID_ICC_PROD>{ data($nombre) }</ns0:ID_ICC_PROD>
	                            }
	                            {
	                                for $fechaAplicacion in $return/aplicablesActivos[1]/fechaAplicacion
	                                return
	                                    <ns0:FECHA_INICIO>{ data($fechaAplicacion) }</ns0:FECHA_INICIO>
	                            }
	                            <ns0:VIGENCIA>{ data($return/aplicablesActivos[1]/diasVigencia) }</ns0:VIGENCIA>
	                        </ns0:PV_PRODUCT_PROM_ITEM>
                        else()
                   else
                   ()
                   
                }
            </ns0:PV_PRODUCT_PROM>
        </ns0:InputParameters>
};

declare variable $getPromosAplicadasResponse1 as element(ns1:getPromosAplicadasResponse) external;
declare variable $bolsasCompraPromoLinea1 as element(ns2:bolsasCompraPromoLinea) external;

xf:IN_XQ_bolsaVigHistReq($getPromosAplicadasResponse1,
    $bolsasCompraPromoLinea1)