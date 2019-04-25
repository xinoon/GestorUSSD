xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getAllInformationResponse1" element="ns0:getAllInformationResponse" location="../../../Alcatel-HighLevelApiWS/SubscriberLineManager/Resources/WSDL/subscriberLineManager.xsd" ::)
(:: pragma bea:global-element-return element="ns1:searchBalancesICC-response" location="../WSDL/searchBalancesICC-response.xsd" ::)

declare namespace ns2 = "http://pojo.web.api.icc.services.osp.in.alcatel.com/xsd";
declare namespace ns1 = "http://ws.nextel.cl/schemas/searchBalanceIcc/alcatel/getAllInformation";
declare namespace ns0 = "http://implementation.web.api.icc.services.osp.in.alcatel.com";
declare namespace xf = "http://tempuri.org/HighLevelApiWS/SearchBalancesICC/Resources/XQ/OUT_PSSubscriberLineManagerService_TO_IN_PSSearchBalancesICCService/";

declare function xf:OUT_PSSubscriberLineManagerService_TO_IN_PSSearchBalancesICCService($getAllInformationResponse1 as element(ns0:getAllInformationResponse),
    $viewBucket as xs:string)
    as element(ns1:searchBalancesICC-response) {
        <ns1:searchBalancesICC-response>
          <ns1:totalBalance>{ 
          	 let $balance1 := $getAllInformationResponse1/ns0:return/ns2:defaultAccount/ns2:balance
          	 let $balance := if (string-length($balance1) <= 2) then '0' else $balance1
          	 let $selBuckets1 :=$getAllInformationResponse1/ns0:return/ns2:defaultAccount/ns2:buckets[ns2:usageLabelRef= ('REW_MIX' ,'PLAN_INITIAL', 'PLAN_NEXTEL' , 'REWARD','EMERGENCY_CREDIT') and not(empty(ns2:remainingUnits/text()))]/ns2:remainingUnits
             let $remainingUnits:=sum($selBuckets1)
          	 let $totalSaldo:=xs:string(xs:integer($remainingUnits)+xs:integer($balance))  
          	 let $totalSaldoCalc:= if ($totalSaldo = '0' or $totalSaldo = '') then '0' else ( concat(substring($totalSaldo, 1,string-length($totalSaldo)-2),'.',
          	            substring($totalSaldo, string-length($totalSaldo)-1)) ) 
          	
          	 return xs:long(xs:double($totalSaldoCalc))

          }</ns1:totalBalance>
          <ns1:balance>{ 
          	 let $balances1 := $getAllInformationResponse1/ns0:return/ns2:defaultAccount/ns2:balance
          	 let $balances := if (string-length($balances1) <= 2) then '0' else $balances1
          	 let $balancesTotal := if ( $balances = '' or $balances = '0' ) then '0' else( substring($balances, 1,string-length($balances)-2) )
          	 return xs:long(xs:double($balancesTotal))

          }</ns1:balance>
            <ns1:error_code>0</ns1:error_code>
              {
	              if (($viewBucket = 'Y' or $viewBucket = 'y')) then  
	                for $buckets in $getAllInformationResponse1/ns0:return/ns2:defaultAccount/ns2:buckets
	                return
	                    <ns1:buckets>
	                        {
	                            for $creationDate in $buckets/ns2:creationDate
	                            return
	                                <ns1:creationDate>{ data($creationDate) }</ns1:creationDate>
	                        }
	                        {
	                            for $glCode in $buckets/ns2:glCode
	                            return
	                                <ns1:glCode>{ data($glCode) }</ns1:glCode>
	                        }
	                        {
	                            for $initialCost in $buckets/ns2:initialCost
	                            return
	                                <ns1:initialCost>{ data($initialCost) }</ns1:initialCost>
	                        }
	                        {
	                            for $initialQuantity in $buckets/ns2:initialQuantity
	                            return
	                                <ns1:initialQuantity>{ data($initialQuantity) }</ns1:initialQuantity>
	                        }
	                        {
	                            for $limitDate in $buckets/ns2:limitDate
	                            return
	                                <ns1:limitDate>{ data($limitDate) }</ns1:limitDate>
	                        }
	                        {
	                            for $remainingUnits in $buckets/ns2:remainingUnits
	                            return
	                                <ns1:remainingUnits>{ if(empty($remainingUnits/text())) then (0) else (data($remainingUnits)) }</ns1:remainingUnits>
	                        }
	                        {
	                            for $rowIdentifier in $buckets/ns2:rowIdentifier
	                            return
	                                <ns1:rowIdentifier>{ data($rowIdentifier) }</ns1:rowIdentifier>
	                        }
	                        {
	                            for $startDate in $buckets/ns2:startDate
	                            return
	                                <ns1:startDate>{ data($startDate) }</ns1:startDate>
	                        }
	                        {
	                            for $usageLabelRef in $buckets/ns2:usageLabelRef
	                            return
	                                <ns1:usageLabelRef>{ data($usageLabelRef) }</ns1:usageLabelRef>
	                        }
	                        {
	                            for $validity in $buckets/ns2:validity
	                            return
	                                <ns1:validity>{ data($validity) }</ns1:validity>
	                        }
	                    </ns1:buckets>
	               else
	               <ns1:buckets/>
	            }
        </ns1:searchBalancesICC-response>
};

declare variable $getAllInformationResponse1 as element(ns0:getAllInformationResponse) external;
declare variable $viewBucket as xs:string external;

xf:OUT_PSSubscriberLineManagerService_TO_IN_PSSearchBalancesICCService($getAllInformationResponse1,
    $viewBucket)