xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$consultaClienteGestorDBOutputCollection1" element="ns0:ConsultaClienteGestorDBOutputCollection" location="../WSDLs/ConsultaClienteGestorDB.xsd" ::)
(:: pragma bea:global-element-return element="ns1:getSearchBSCSBundlesResponse" location="../WSDLs/BSCSBundleService_schema1.xsd" ::)

declare namespace ns1 = "http://bolsas.bscs.bundle.ws.ncl.nii.com";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ConsultaClienteGestorDB";
declare namespace xs = "http://www.w3.org/2001/XMLSchema";
declare namespace xf = "http://tempuri.org/BSCSBundles/Resources/XQuery/OUT_XQ_BSConsultaClienteGestor_TO_ConsultaClienteGestor/";

declare function xf:OUT_XQ_BSConsultaClienteGestor_TO_ConsultaClienteGestor($consultaClienteGestorDBOutputCollection1 as element(ns0:ConsultaClienteGestorDBOutputCollection))
    as element(ns1:getSearchBSCSBundlesResponse) {
        <ns1:getSearchBSCSBundlesResponse>
            {
            <packages>
            {
           	for $indexSP in distinct-values((data($consultaClienteGestorDBOutputCollection1/ns0:ConsultaClienteGestorDBOutput/ns0:SPCODE)))
           	let $TMP_SPCODE0 := data($indexSP)
           	return
     	      for $indexDesc in distinct-values((data($consultaClienteGestorDBOutputCollection1/ns0:ConsultaClienteGestorDBOutput/ns0:COD_TIPO_TRAFICO)))
              let $TMP_DESC := data($indexDesc)
              return    
    	      <item_pkg>
              	<spcode>{$TMP_SPCODE0}</spcode>
           		<desc_packages>{$TMP_DESC}</desc_packages>
        		<services>
                {     
                   	for $ConsultaClienteGestorDBOutputSn in $consultaClienteGestorDBOutputCollection1/ns0:ConsultaClienteGestorDBOutput
                   	let $TMP_SNCODE := data($ConsultaClienteGestorDBOutputSn/ns0:SNCODE)
                   	let $TMP_TMID := data($ConsultaClienteGestorDBOutputSn/ns0:TEMPLATE_ID)
                   	let $TMP_SPCODE2 := data($ConsultaClienteGestorDBOutputSn/ns0:SPCODE)
                   	let $TMP_BUNDLE_VALUE := data($ConsultaClienteGestorDBOutputSn/ns0:BUNDLE_VALUE)
                   	let $TMP_BUNDLE_UNIT := data($ConsultaClienteGestorDBOutputSn/ns0:BUNDLE_UNIT)
                   	let $TMP_BUNDLE_TYPE := data($ConsultaClienteGestorDBOutputSn/ns0:BUNDLE_TYPE)
                   	let $TMP_DESC2 := data($ConsultaClienteGestorDBOutputSn/ns0:COD_TIPO_TRAFICO)
                   	let $TMP_SV_DES := data($ConsultaClienteGestorDBOutputSn/ns0:SV_DES)
                   	return
                	    if( $TMP_SPCODE0 = $TMP_SPCODE2 ) then (
                   	    	if($TMP_DESC = $TMP_DESC2) then (
								<item_srv>
 									<sncode>{ $TMP_SNCODE }</sncode>
									<sv_des>{ $TMP_SV_DES }</sv_des>
									<templ_id>{ $TMP_TMID }</templ_id>
									<bundles>
										<item_bls>
		                                  <bundle_value>{ $TMP_BUNDLE_VALUE }</bundle_value>
		                                  <bundle_unit>{ $TMP_BUNDLE_UNIT }</bundle_unit>
		                                  <bundle_type>{ $TMP_BUNDLE_TYPE }</bundle_type>
				                        </item_bls>
				   			        </bundles>
								</item_srv>
							 )else()
							)else()
						}
					 </services>
					</item_pkg>
				}
                  </packages>
            }
            <errorCode>0</errorCode>
		   <errorDescription>OK</errorDescription> 
        </ns1:getSearchBSCSBundlesResponse>
};

declare variable $consultaClienteGestorDBOutputCollection1 as element(ns0:ConsultaClienteGestorDBOutputCollection) external;

xf:OUT_XQ_BSConsultaClienteGestor_TO_ConsultaClienteGestor($consultaClienteGestorDBOutputCollection1)