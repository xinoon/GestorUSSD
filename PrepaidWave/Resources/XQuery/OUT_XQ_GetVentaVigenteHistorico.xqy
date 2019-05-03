xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../WSDL/PROVI_BOLS_NII_QUERY_PREPAID_WAVE_PKG_GET_INF_PROMO_COMPRA_BOLSA_PRC.xsd" ::)
(:: pragma bea:global-element-return element="ns1:bolsasCompraPromoLineaResponse" location="../WSDL/PrepaidWaveService.xsd" ::)

declare namespace ns1 = "http://prepaid.wave.ws.ncl.nii.com";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_QUERY_PREPAID_WAVE_PKG/GET_INF_PROMO_COMPRA_BOLSA_PRC/";
declare namespace xf = "http://tempuri.org/PrepaidWave/Resources/XQuery/OUT_XQ_GetVentaVigenteHistorico/";

declare function xf:OUT_XQ_GetVentaVigenteHistorico($outputParameters1 as element(ns0:OutputParameters))
    as element(ns1:bolsasCompraPromoLineaResponse) {
        <ns1:bolsasCompraPromoLineaResponse>
            <cantidadBolsas>{ sum(xs:int(data($outputParameters1/ns0:SN_BUNDLE_COUNT)) + xs:int(data($outputParameters1/ns0:SN_BUNDLE_PROM_COUNT))) }</cantidadBolsas>
            {
            	let $result :=
            	if(xs:int(data($outputParameters1/ns0:SN_BUNDLE_COUNT)) > 0) then 
                	if(not(empty($outputParameters1/ns0:ST_HIST_MOV_BOLSA_QT_LIST/ns0:ST_HIST_MOV_PROMOS_ITEM))) then
	                for $ST_HIST_MOV_PROMOS_ITEM in $outputParameters1/ns0:ST_HIST_MOV_BOLSA_QT_LIST/ns0:ST_HIST_MOV_PROMOS_ITEM
	                return
	                    <bolsas>
	                        <nombreBolsa>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:NOM_BOLSA) }</nombreBolsa>
	                        <vigencia>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:VIGENCIA) }</vigencia>
	                        <tipBolsa>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:TIP_BOLSA) }</tipBolsa>
	                        <tipAplicacion>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:TIP_APLICACION) }</tipAplicacion>
	                        <recurrencia>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:RECURRENCIA) }</recurrencia>
	                        <unidRecurrencia>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:UNID_RECURRECIA) }</unidRecurrencia>
	                        <motivo>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:MOTIVO) }</motivo>
	                        <unidContenida>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:UND_CONTENIDA) }</unidContenida>
	                        <unidMedida>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:UNID_MEDIDA_BOLSA) }</unidMedida>
	                        <valorBolsa>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:VALOR_BOLSA) }</valorBolsa>
	                        <tipTrafico>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:TIP_TRAFICO) }</tipTrafico>
	                        <DetContenidoMix>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:DETALLE_CONTENIDO) }</DetContenidoMix>
	                        <fechaCompra>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:FECHA_COMPRA) }</fechaCompra>
	                        <fechaInicio>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:FECHA_INICIO) }</fechaInicio>
	                        <fechaFin>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:FECHA_FIN) }</fechaFin>
	                        <clasificaBolsa>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:CLASIFICA_BOLSA) }</clasificaBolsa>
	                    </bolsas>
	                    else
	                    ()
	                else
	                ()
				return $result
            }
            {
            	let $result2 :=
            	if(xs:int(data($outputParameters1/ns0:SN_BUNDLE_PROM_COUNT)) > 0) then 
                if(not(empty($outputParameters1/ns0:ST_HIST_MOV_PROMOS/ns0:ST_HIST_MOV_PROMOS_ITEM))) then
                for $ST_HIST_MOV_PROMOS_ITEM in $outputParameters1/ns0:ST_HIST_MOV_PROMOS/ns0:ST_HIST_MOV_PROMOS_ITEM
                return
                    <bolsas>
                        <nombreBolsa>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:NOM_BOLSA) }</nombreBolsa>
                        <vigencia>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:VIGENCIA) }</vigencia>
                        <tipBolsa>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:TIP_BOLSA) }</tipBolsa>
                        <tipAplicacion>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:TIP_APLICACION) }</tipAplicacion>
                        <recurrencia>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:RECURRENCIA) }</recurrencia>
                        <unidRecurrencia>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:UNID_RECURRECIA) }</unidRecurrencia>
                        <motivo>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:MOTIVO) }</motivo>
                        <unidContenida>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:UND_CONTENIDA) }</unidContenida>
                        <unidMedida>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:UNID_MEDIDA_BOLSA) }</unidMedida>
                        <valorBolsa>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:VALOR_BOLSA) }</valorBolsa>
                        <tipTrafico>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:TIP_TRAFICO) }</tipTrafico>
                        <DetContenidoMix>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:DETALLE_CONTENIDO) }</DetContenidoMix>
                        <fechaCompra>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:FECHA_COMPRA) }</fechaCompra>
                        <fechaInicio>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:FECHA_INICIO) }</fechaInicio>
                        <fechaFin>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:FECHA_FIN) }</fechaFin>
                        <clasificaBolsa>{ data($ST_HIST_MOV_PROMOS_ITEM/ns0:CLASIFICA_BOLSA) }</clasificaBolsa>
                    </bolsas>
                    	 else
	                    ()
	                else
	                ()
            	return $result2
            }
			<errorCode>0</errorCode>
            <errorDescription>{
            if(sum(xs:int(data($outputParameters1/ns0:SN_BUNDLE_COUNT)) + xs:int(data($outputParameters1/ns0:SN_BUNDLE_PROM_COUNT))) > 0) then
            ('OK')
            else
            ('No existe resultado para la busqueda.')
            }</errorDescription>
        </ns1:bolsasCompraPromoLineaResponse>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:OUT_XQ_GetVentaVigenteHistorico($outputParameters1)