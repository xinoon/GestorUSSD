xquery version "2004-draft";
(:: pragma bea:local-element-parameter parameter="$contractServicesWrite1" type="ns1:JcontractServicesUpdate/ns0:input/ns1:services/ns1:item/ns1:contractServicesWrite" location="../../../3GBSCS/Resources/WSDLs/JcontractServicesUpdate.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:JcontractServicesUpdate" location="../../../3GBSCS/Resources/WSDLs/JcontractServicesUpdate.wsdl" ::)

declare namespace ns1 = "http://www.lhsgroup.com/ws_v2_NII_1";
declare namespace ns0 = "http://xml.apache.org/axis/wsdd/providers/java";
declare namespace xf = "http://tempuri.org/BSCSBundles/Resources/XQuery/IN_XQ_PWriteBscsBundleService-Package_TO_BSJContractServiceUpdate/";

declare function xf:IN_XQ_PWriteBscsBundleService-Package_TO_BSJContractServiceUpdate($contractServicesWrite1 as element())
    as element(ns1:JcontractServicesUpdate) {
        <ns1:JcontractServicesUpdate>
            <ns0:input>
                <ns1:services>
                    <ns1:item>
                        <ns1:contractServicesWrite>
                            {
                                for $coId in $contractServicesWrite1/ns1:coId
                                return
                                    <ns1:coId>{ data($coId) }</ns1:coId>
                            }
                            <ns1:services>
                                {
                                    for $item in $contractServicesWrite1/ns1:services/ns1:item
                                    return
                                        <ns1:item>
                                            {
                                                for $cosPendingStatus in $item/ns1:cosPendingStatus
                                                return
                                                    <ns1:cosPendingStatus>{ data($cosPendingStatus) }</ns1:cosPendingStatus>
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
                                        </ns1:item>
                                }
                            </ns1:services>
                        </ns1:contractServicesWrite>
                    </ns1:item>
                </ns1:services>
            </ns0:input>
            <ns0:sessionChange>
                <ns1:values>
                    <ns1:item>
                        <ns1:key>BU_ID</ns1:key>
                        <ns1:value>2</ns1:value>
                    </ns1:item>
                </ns1:values>
            </ns0:sessionChange>
        </ns1:JcontractServicesUpdate>
};

declare variable $contractServicesWrite1 as element() external;

xf:IN_XQ_PWriteBscsBundleService-Package_TO_BSJContractServiceUpdate($contractServicesWrite1)