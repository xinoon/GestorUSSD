xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$consultaClienteGestorADDBOutputCollection1" element="ns1:ConsultaClienteGestorADDBOutputCollection" location="../WSDLs/ConsultaClienteGestorADDB.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getSearchBSCSBundlesResponse" location="../WSDLs/BSCSBundleService_schema1.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ConsultaClienteGestorADDB";
declare namespace ns0 = "http://bolsas.bscs.bundle.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/BSCSBundles/Resources/XQuery/OUT_XQ_BSConsultaClienteGestorAD_TO_ConsultaClienteGestorAD/";

declare function xf:OUT_XQ_BSConsultaClienteGestorAD_TO_ConsultaClienteGestorAD($consultaClienteGestorADDBOutputCollection1 as element(ns1:ConsultaClienteGestorADDBOutputCollection))
    as element(ns0:getSearchBSCSBundlesResponse) {
        <ns0:getSearchBSCSBundlesResponse>
            {
            <packages>
            {
           	for $indexSP in distinct-values((data($consultaClienteGestorADDBOutputCollection1/ns1:ConsultaClienteGestorADDBOutput/ns1:SPCODE)))
           	let $TMP_SPCODE0 := data($indexSP)
          	return
          		for $indexDesc in distinct-values((data($consultaClienteGestorADDBOutputCollection1/ns1:ConsultaClienteGestorADDBOutput/ns1:COD_TIPO_TRAFICO)))
          		let $TMP_DESC := data($indexDesc)
          		return
		    	<item_pkg>
				<spcode>{  $TMP_SPCODE0  }</spcode>
               	<desc_packages>{ $TMP_DESC  }</desc_packages>
    			<services>
	            {for $ConsultaClienteGestorDBOutputSn in $consultaClienteGestorADDBOutputCollection1/ns1:ConsultaClienteGestorADDBOutput
				 let $TMP_SNCODE := data($ConsultaClienteGestorDBOutputSn/ns1:SNCODE)
				 let $TMP_TMID := data($ConsultaClienteGestorDBOutputSn/ns1:TEMPLATE_ID)
				 let $TMP_SPCODE2 := data($ConsultaClienteGestorDBOutputSn/ns1:SPCODE)
				 let $TMP_BUNDLE_VALUE := data($ConsultaClienteGestorDBOutputSn/ns1:BUNDLE_VALUE)
				 let $TMP_BUNDLE_UNIT := data($ConsultaClienteGestorDBOutputSn/ns1:BUNDLE_UNIT)
				 let $TMP_BUNDLE_TYPE:= data($ConsultaClienteGestorDBOutputSn/ns1:BUNDLE_TYPE)
				 let $TMP_DESC2 := data($ConsultaClienteGestorDBOutputSn/ns1:COD_TIPO_TRAFICO)
			 	 let $SV_DES := data($ConsultaClienteGestorDBOutputSn/ns1:SV_DES)
			 	 return
				 	if( $TMP_SPCODE0 = $TMP_SPCODE2 ) then (
					 	if($TMP_DESC = $TMP_DESC2) then (
							<item_srv>
								<sncode>{ $TMP_SNCODE }</sncode>
								<sv_des>{ $SV_DES }</sv_des>
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
        </ns0:getSearchBSCSBundlesResponse>
};

declare variable $consultaClienteGestorADDBOutputCollection1 as element(ns1:ConsultaClienteGestorADDBOutputCollection) external;

xf:OUT_XQ_BSConsultaClienteGestorAD_TO_ConsultaClienteGestorAD($consultaClienteGestorADDBOutputCollection1)