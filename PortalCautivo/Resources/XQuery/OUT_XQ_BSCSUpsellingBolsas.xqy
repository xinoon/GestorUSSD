xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../WSDLs/PROVI_BOLS_GET_UPSELLING_COMPRA_BOLSAS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:getUpsellingCompraBolsasResponse" location="../WSDLs/BSCSUpsellingBolsasService_schema.xsd" ::)

declare namespace ns1 = "http://upselling.bolsas.bscs.bundle.ws.ncl.nii.com";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_BSCS_PORTAL_CAUTIVO_PKG/GET_UPSELLING_COMPRA_BOLSAS/";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/OUT_XQ_BSCSUpsellingBolsas/";
declare function xf:trimBool($nomBuck as xs:string ) as xs:boolean
{
        
		let $shortName := string-length(replace(replace($nomBuck,'\s+$',''),'^\s+','')) <= 0
		return $shortName
    
};

declare function xf:OUT_XQ_BSCSUpsellingBolsas($outputParameters1 as element(ns0:OutputParameters),
    $flagSms as xs:string,
    $flagDatos as xs:string,
    $flagVoz as xs:string,
    $flagMixta as xs:string)
    as element(ns1:getUpsellingCompraBolsasResponse) {
        <ns1:getUpsellingCompraBolsasResponse>
            <bundleAmount>{ data($outputParameters1/ns0:SN_BUNDLE_COUNT) }</bundleAmount>
            {
                let $SV_BUNDLE_UPSELLING_QT_LIST := $outputParameters1/ns0:SV_BUNDLE_UPSELLING_QT_LIST
                return
                    <listaBundles>
                        {
                            for $SV_BUNDLE_UPSELLING_QT_LIST_ITEM in $SV_BUNDLE_UPSELLING_QT_LIST/ns0:SV_BUNDLE_UPSELLING_QT_LIST_ITEM
                            
                            
                            return
                            if($flagMixta != 'S') then
	                            if($flagSms != 'N' and upper-case(data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:TRAFFIC_TYPE)) = 'SMS')then
	                            (
	                            	<item_bundle>
	                                    <cod_prod>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:ID_PROD) }</cod_prod>
	                                    <cod_pcrf>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:ID_PCRF_PROD) }</cod_pcrf>
	                                    <cod_bscs>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:ID_BSCS_PROD) }</cod_bscs>
	                                    <bundleName>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:NAME_PROD) }</bundleName>
	                                    <priority>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:LEVEL_PROD) }</priority>
	                                    <trafic_type>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:TRAFFIC_TYPE) }</trafic_type>
	                                    <platform_bundle>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:PLATFORM_ACT) }</platform_bundle>
	                                </item_bundle>
	                            )
	                            else
	                            (
		                            if($flagDatos != 'N' and upper-case(data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:TRAFFIC_TYPE)) = 'DATOS')then
			                            (
			                            	<item_bundle>
			                                    <cod_prod>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:ID_PROD) }</cod_prod>
			                                    <cod_pcrf>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:ID_PCRF_PROD) }</cod_pcrf>
			                                    <cod_bscs>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:ID_BSCS_PROD) }</cod_bscs>
			                                    <bundleName>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:NAME_PROD) }</bundleName>
			                                    <priority>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:LEVEL_PROD) }</priority>
			                                    <trafic_type>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:TRAFFIC_TYPE) }</trafic_type>
			                                    <platform_bundle>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:PLATFORM_ACT) }</platform_bundle>
			                                </item_bundle>
			                            )
			                            else
			                            (
		                            		if($flagVoz != 'N' and upper-case(data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:TRAFFIC_TYPE)) = 'VOZ')then
				                            (
				                            	<item_bundle>
				                                    <cod_prod>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:ID_PROD) }</cod_prod>
				                                    <cod_pcrf>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:ID_PCRF_PROD) }</cod_pcrf>
				                                    <cod_bscs>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:ID_BSCS_PROD) }</cod_bscs>
				                                    <bundleName>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:NAME_PROD) }</bundleName>
				                                    <priority>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:LEVEL_PROD) }</priority>
				                                    <trafic_type>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:TRAFFIC_TYPE) }</trafic_type>
				                                    <platform_bundle>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:PLATFORM_ACT) }</platform_bundle>
				                                </item_bundle>
				                            )
				                            else
				                            ()
			                            )
                             	)
                            else
                            (
                            	if($flagVoz != 'N' and upper-case(data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:TRAFFIC_TYPE)) = 'MIXTAS' and $flagDatos != 'N'  and xf:trimBool(data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:DATOS))= xs:boolean('false') and $flagSms != 'N'  and xf:trimBool(data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:SMS))= xs:boolean('false'))then
	                             (
	                            	<item_bundle>
	                                    <cod_prod>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:ID_PROD) }</cod_prod>
	                                    <cod_pcrf>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:ID_PCRF_PROD) }</cod_pcrf>
	                                    <cod_bscs>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:ID_BSCS_PROD) }</cod_bscs>
	                                    <bundleName>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:NAME_PROD) }</bundleName>
	                                    <priority>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:LEVEL_PROD) }</priority>
	                                    <trafic_type>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:TRAFFIC_TYPE) }</trafic_type>
	                                    <platform_bundle>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:PLATFORM_ACT) }</platform_bundle>
	                                </item_bundle>
	                            )else(
									if ($flagVoz != 'N' and upper-case(data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:TRAFFIC_TYPE)) = 'MIXTAS' and $flagDatos != 'N'  and xf:trimBool(data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:DATOS))= xs:boolean('false'))then
			                            (
			                            	<item_bundle>
			                                    <cod_prod>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:ID_PROD) }</cod_prod>
			                                    <cod_pcrf>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:ID_PCRF_PROD) }</cod_pcrf>
			                                    <cod_bscs>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:ID_BSCS_PROD) }</cod_bscs>
			                                    <bundleName>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:NAME_PROD) }</bundleName>
			                                    <priority>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:LEVEL_PROD) }</priority>
			                                    <trafic_type>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:TRAFFIC_TYPE) }</trafic_type>
			                                    <platform_bundle>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:PLATFORM_ACT) }</platform_bundle>
			                                </item_bundle>
			                            )
			                            else
			                            (
				                    		if($flagVoz != 'N' and upper-case(data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:TRAFFIC_TYPE)) = 'MIXTAS' and $flagSms != 'N'  and xf:trimBool(data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:SMS))= xs:boolean('false'))then
				                            (
				                            	<item_bundle>
				                                    <cod_prod>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:ID_PROD) }</cod_prod>
				                                    <cod_pcrf>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:ID_PCRF_PROD) }</cod_pcrf>
				                                    <cod_bscs>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:ID_BSCS_PROD) }</cod_bscs>
				                                    <bundleName>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:NAME_PROD) }</bundleName>
				                                    <priority>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:LEVEL_PROD) }</priority>
				                                    <trafic_type>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:TRAFFIC_TYPE) }</trafic_type>
				                                    <platform_bundle>{ data($SV_BUNDLE_UPSELLING_QT_LIST_ITEM/ns0:PLATFORM_ACT) }</platform_bundle>
				                                </item_bundle>
				                            )
				                            else
				                            (
				                            
				                            )
			                            )
		                        )
                            ) 

                                
                        }
                    </listaBundles>
            }
            <errorCode>{ data($outputParameters1/ns0:SN_COD_RETORNO) }</errorCode>
            <errorDescription>{ concat($outputParameters1/ns0:SV_MENS_RETORNO) }</errorDescription>
        </ns1:getUpsellingCompraBolsasResponse>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;
declare variable $flagSms as xs:string external;
declare variable $flagDatos as xs:string external;
declare variable $flagVoz as xs:string external;
declare variable $flagMixta as xs:string external;

xf:OUT_XQ_BSCSUpsellingBolsas($outputParameters1,
    $flagSms,
    $flagDatos,
    $flagVoz,
    $flagMixta)