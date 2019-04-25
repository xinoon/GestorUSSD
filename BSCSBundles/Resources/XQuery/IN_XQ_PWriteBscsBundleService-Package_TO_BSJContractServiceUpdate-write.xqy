xquery version "2004-draft";
(:: pragma bea:local-element-parameter parameter="$packages1" type="ns0:setWriteBSCSBundle/packages" location="../WSDLs/BSCSBundleService_schema1.xsd" ::)
(:: pragma bea:local-element-return type="ns2:JcontractServicesUpdate/ns1:input/ns2:services/ns2:item/ns2:contractServicesWrite" location="../../../3GBSCS/Resources/WSDLs/JcontractServicesUpdate.wsdl" ::)

declare namespace ns2 = "http://www.lhsgroup.com/ws_v2_NII_1";
declare namespace ns1 = "http://xml.apache.org/axis/wsdd/providers/java";
declare namespace ns0 = "http://bolsas.bscs.bundle.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/BSCSBundles/Resources/XQuery/IN_XQ_PWriteBscsBundleService-Package_TO_BSJContractServiceUpdate-write/";

declare function xf:IN_XQ_PWriteBscsBundleService-Package_TO_BSJContractServiceUpdate-write($in_param_contractId as xs:string,
    $in_param_cosPendingStatus as xs:string,
    $in_param_profileId as xs:string,
    $packages1 as element())
    as element() {
        <ns2:contractServicesWrite>
            <ns2:coId>{ data($in_param_contractId) }</ns2:coId>
            <ns2:services>
                {
                    for $item_pkg in $packages1/item_pkg,
                        $item_srv in $item_pkg/services/item_srv
                    return
                        <ns2:item>
                            <ns2:cosPendingStatus>{ data($in_param_cosPendingStatus) }</ns2:cosPendingStatus>
                            <ns2:profileId>{ data($in_param_profileId) }</ns2:profileId>
                            <ns2:sncode>{ data($item_srv/sncode) }</ns2:sncode>
                        </ns2:item>
                }
            </ns2:services>
        </ns2:contractServicesWrite>
};

declare variable $in_param_contractId as xs:string external;
declare variable $in_param_cosPendingStatus as xs:string external;
declare variable $in_param_profileId as xs:string external;
declare variable $packages1 as element() external;

xf:IN_XQ_PWriteBscsBundleService-Package_TO_BSJContractServiceUpdate-write($in_param_contractId,
    $in_param_cosPendingStatus,
    $in_param_profileId,
    $packages1)