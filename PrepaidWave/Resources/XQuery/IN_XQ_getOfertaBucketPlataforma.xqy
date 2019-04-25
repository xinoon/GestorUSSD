xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getAllInformationResponse1" element="ns0:getAllInformationResponse" location="../../../Alcatel-HighLevelApiWS/SubscriberLineManager/Resources/WSDL/subscriberLineManager.xsd" ::)
(:: pragma bea:schema-type-parameter parameter="$sReturnVO1" type="ns2:SReturnVO" location="../../../PCRF/WSDL/UPCCProvisioning.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../WSDL/PROVI_BOLS_NII_QUERY_PREPAID_WAVE_PKG_GET_OFERTA_BUCKET.xsd" ::)

declare namespace ns2 = "rm:type";
declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_QUERY_PREPAID_WAVE_PKG/GET_OFERTA_BUCKET/";
declare namespace ns3 = "http://pojo.web.api.icc.services.osp.in.alcatel.com/xsd";
declare namespace ns0 = "http://implementation.web.api.icc.services.osp.in.alcatel.com";
declare namespace xf = "http://tempuri.org/PrepaidWave/Resources/XQuery/IN_XQ_getOfertaBucketPlataforma/";

declare function xf:IN_XQ_getOfertaBucketPlataforma($getAllInformationResponse1 as element(ns0:getAllInformationResponse),
    $sReturnVO1 as element(),
    $shdes as xs:string)
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:IV_SHDES>{$shdes}</ns1:IV_SHDES>
            <ns1:IT_BUCKET_PROD_QT_LIST>
                {
					if(not(empty($sReturnVO1))) then (
					    if(not(empty($sReturnVO1/subscribedService))) then(
					    	for $subscribedService in $sReturnVO1/subscribedService
					    	let $srvname := $subscribedService/attribute[key eq 'SRVNAME']/value/text()
							return 
									<ns1:IT_BUCKET_PROD_QT_LIST_ITEM>
										<ns1:ID_PROD_BUCKET>{ $srvname }</ns1:ID_PROD_BUCKET>
									</ns1:IT_BUCKET_PROD_QT_LIST_ITEM>
			
                		)else(
						)
					)else(
					)
               }
               {
                	if(not(empty($getAllInformationResponse1)))then (
		                if(not(empty($getAllInformationResponse1/ns0:return/ns3:defaultAccount/ns3:buckets))) then(
			                for $buckets in $getAllInformationResponse1/ns0:return/ns3:defaultAccount/ns3:buckets
							return
								<ns1:IT_BUCKET_PROD_QT_LIST_ITEM>
									{
										if(not(empty($buckets/ns3:usageLabelRef))) then (
											for $usageLabelRef in $buckets/ns3:usageLabelRef
											return
												<ns1:ID_PROD_BUCKET>{ data($usageLabelRef) }</ns1:ID_PROD_BUCKET>		
										)else(
										)
									 }
									 {
									
										if(not(empty($buckets/ns3:rowIdentifier))) then (
											for $rowIdentifier in $buckets/ns3:rowIdentifier
											return
												<ns1:DESC_BUCKET>{data($rowIdentifier)}</ns1:DESC_BUCKET>			
										)else(
										)
									}
								</ns1:IT_BUCKET_PROD_QT_LIST_ITEM>
				                
		                )else(
		                )
		             )else(
		             )
                }               
            </ns1:IT_BUCKET_PROD_QT_LIST>
        </ns1:InputParameters>
};

declare variable $getAllInformationResponse1 as element(ns0:getAllInformationResponse) external;
declare variable $sReturnVO1 as element() external;
declare variable $shdes as xs:string external;

xf:IN_XQ_getOfertaBucketPlataforma($getAllInformationResponse1,
    $sReturnVO1,
    $shdes)