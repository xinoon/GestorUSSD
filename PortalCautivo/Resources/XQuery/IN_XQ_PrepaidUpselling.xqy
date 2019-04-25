xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$setNextelActiveProduct1" element="ns0:setNextelActiveProduct" location="../WSDLs/TraficTypePortal.xsd" ::)
(:: pragma bea:global-element-return element="ns1:getUpsellingCompraBolsas" location="../WSDLs/BSCSUpsellingBolsasService_schema.xsd" ::)

declare namespace ns1 = "http://upselling.bolsas.bscs.bundle.ws.ncl.nii.com";
declare namespace ns0 = "http://captive.portal.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/PrepaidWave/Resources/XQuery/IN_XQ_PrepaidUpselling/";

declare function xf:IN_XQ_PrepaidUpselling($setNextelActiveProduct1 as element(ns0:setNextelActiveProduct))
    as element(ns1:getUpsellingCompraBolsas) {
        <ns1:getUpsellingCompraBolsas>
            <nro_cel>{ data($setNextelActiveProduct1/phone_number) }</nro_cel>
            <rate_plan>{ data($setNextelActiveProduct1/codPlan) }</rate_plan>
            <segment_prod>{ data($setNextelActiveProduct1/segment_prod) }</segment_prod>
            <client_name>{ data($setNextelActiveProduct1/channel_act) }</client_name>
            <traffic_type>{ 
            if( upper-case(data($setNextelActiveProduct1/type_prod_bscs)) = 'BOL_MIX') then
            ('MIXTAS')
            else(
	            if( upper-case(data($setNextelActiveProduct1/tecnologia)) = 'MUS') then
	            ('MUSICA')
	            else(
		            if( upper-case(data($setNextelActiveProduct1/tecnologia)) = ('TEM','SUS','BUC')) then
		            ('TEMATICA')
		            else(
		            data($setNextelActiveProduct1/traffic_type)
		            )	            
	            )
            )
             }</traffic_type>
            <platform_act>{ data($setNextelActiveProduct1/platform_act) }</platform_act>
        </ns1:getUpsellingCompraBolsas>
};

declare variable $setNextelActiveProduct1 as element(ns0:setNextelActiveProduct) external;

xf:IN_XQ_PrepaidUpselling($setNextelActiveProduct1)