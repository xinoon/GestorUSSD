xquery version "2004-draft";
(:: pragma bea:local-element-parameter parameter="$services1" type="ns1:JcontractCreate/ns0:input/ns1:contractServicesAdd/ns1:services" location="../../../3GBSCS/Resources/WSDLs/JcontractCreate.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:JcontractCreate" location="../../../3GBSCS/Resources/WSDLs/JcontractCreate.wsdl" ::)

declare namespace ns1 = "http://www.lhsgroup.com/ws_v2_NII_1";
declare namespace ns0 = "http://xml.apache.org/axis/wsdd/providers/java";
declare namespace xf = "http://tempuri.org/BSCSBundles/Resources/XQuery/IN_XQ_PWriteBscsBundleService_TO_BSJContractCreate/";

declare function xf:IN_XQ_PWriteBscsBundleService_TO_BSJContractCreate($enterpriseID1 as xs:long,
    $in_param_plcode as xs:string,
    $in_param_rpcode as xs:string,
    $in_param_sccode as xs:string,
    $in_param_submId as xs:string,
    $dnId_Type as xs:long,
    $snCore_Type as xs:long,
    $services1 as element())
    as element(ns1:JcontractCreate) {
        <ns1:JcontractCreate>
            <ns0:input>
                <ns1:contractNew>
                    <ns1:csId>{ $enterpriseID1 }</ns1:csId>
                    <ns1:plcode>{ data($in_param_plcode) }</ns1:plcode>
                    <ns1:rpcode>{ data($in_param_rpcode) }</ns1:rpcode>
                    <ns1:sccode>{ data($in_param_sccode) }</ns1:sccode>
                    <ns1:submId>{ data($in_param_submId) }</ns1:submId>
                </ns1:contractNew>
                <ns1:contractServicesAdd>
                    <ns1:services>
                        {
                            for $item in $services1/ns1:item
                            return
                                <ns1:item>
                                    {
                                        for $cosTemplId in $item/ns1:cosTemplId
                                        return
                                            <ns1:cosTemplId>{ data($cosTemplId) }</ns1:cosTemplId>
                                    }
                                    {
                                        for $profileId in $item/ns1:profileId
                                        return
                                            <ns1:profileId>{ data($profileId) }</ns1:profileId>
                                    }
                                    {
                                        for $sncode in $item/ns1:sncode
                                        return
                                            <ns1:sncode>{ data($sncode) }</ns1:sncode>
                                    }
                                    {
                                        for $spcode in $item/ns1:spcode
                                        return
                                            <ns1:spcode>{ data($spcode) }</ns1:spcode>
                                    }
                                </ns1:item>
                        }
                    </ns1:services>
                </ns1:contractServicesAdd>
                <ns1:contractWrite>
                    <ns1:coStatus>2</ns1:coStatus>
                </ns1:contractWrite>
                <ns1:serviceResources>
                    <ns1:item>
                        <ns1:contractServiceResourcesWrite>
                            <ns1:directoryNumbers>
                                <ns1:item>
                                    <ns1:dnId>{ $dnId_Type }</ns1:dnId>
                                    <ns1:mainDirnum>true</ns1:mainDirnum>
                                </ns1:item>
                            </ns1:directoryNumbers>
                            <ns1:profileId>0</ns1:profileId>
                            <ns1:sncode>{ $snCore_Type }</ns1:sncode>
                        </ns1:contractServiceResourcesWrite>
                    </ns1:item>
                </ns1:serviceResources>
            </ns0:input>
            <ns0:sessionChange>
                <ns1:values>
                    <ns1:item>
                        <ns1:key>BU_ID</ns1:key>
                        <ns1:value>2</ns1:value>
                    </ns1:item>
                </ns1:values>
            </ns0:sessionChange>
        </ns1:JcontractCreate>
};

declare variable $enterpriseID1 as xs:long external;
declare variable $in_param_plcode as xs:string external;
declare variable $in_param_rpcode as xs:string external;
declare variable $in_param_sccode as xs:string external;
declare variable $in_param_submId as xs:string external;
declare variable $dnId_Type as xs:long external;
declare variable $snCore_Type as xs:long external;
declare variable $services1 as element() external;

xf:IN_XQ_PWriteBscsBundleService_TO_BSJContractCreate($enterpriseID1,
    $in_param_plcode,
    $in_param_rpcode,
    $in_param_sccode,
    $in_param_submId,
    $dnId_Type,
    $snCore_Type,
    $services1)