xquery version "2004-draft";
(:: pragma bea:local-element-parameter parameter="$packages1" type="ns0:setWriteBSCSBundle/packages" location="../WSDLs/BSCSBundleService_schema1.xsd" ::)
(:: pragma bea:local-element-return type="ns2:JcontractServicesAdd/ns1:input/ns2:services/ns2:item/ns2:contractServicesWrite" location="../../../3GBSCS/Resources/WSDLs/JcontractServicesAdd.wsdl" ::)

declare namespace ns2 = "http://www.lhsgroup.com/ws_v2_NII_1";
declare namespace ns1 = "http://xml.apache.org/axis/wsdd/providers/java";
declare namespace ns0 = "http://bolsas.bscs.bundle.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/BSCSBundles/Resources/XQuery/IN_XQ_PWriteBscsBundleService-Package_TO_BSJCreateServiceAdd-write/";

declare function xf:IN_XQ_PWriteBscsBundleService-Package_TO_BSJCreateServiceAdd-write($packages1 as element(),
    $in_coId as xs:string,
    $in_profileId as xs:string,
    $in_cosPendingStatus as xs:string)
    as element() {
        <ns2:contractServicesWrite>
            <ns2:coId>{ data($in_coId) }</ns2:coId>
            <ns2:services>
                {
                    for $item_pkg in $packages1/item_pkg,
                        $item_srv in $item_pkg/services/item_srv
                    return
                        <ns2:item>
                            <ns2:cosPendingStatus>{ $in_cosPendingStatus }</ns2:cosPendingStatus>
                            <ns2:profileId>{ $in_profileId }</ns2:profileId>
                            <ns2:sncode>{ data($item_srv/sncode) }</ns2:sncode>
                        </ns2:item>
                }
            </ns2:services>
        </ns2:contractServicesWrite>
};

declare variable $packages1 as element() external;
declare variable $in_coId as xs:string external;
declare variable $in_profileId as xs:string external;
declare variable $in_cosPendingStatus as xs:string external;

xf:IN_XQ_PWriteBscsBundleService-Package_TO_BSJCreateServiceAdd-write($packages1,
    $in_coId,
    $in_profileId,
    $in_cosPendingStatus)