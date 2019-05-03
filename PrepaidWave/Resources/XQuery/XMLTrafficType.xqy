xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$DATA" element="DATA" location="../WSDL/XMLTrafico.xsd" ::)
(:: pragma bea:global-element-return element="TOTAL_TRAF_DET_ITEM" location="../WSDL/XMLTrafico.xsd" ::)

declare namespace xf = "http://tempuri.org/PrepaidWave/Resources/XQuery/XMLTrafficType/";

declare function xf:sumHhMnSs($hora as xs:string,$minuto as xs:string,$segundo as xs:string) as xs:string
{
	let $sqlstring := concat('select (trunc(sysdate)  + ',$hora, '/24+ ',$minuto,'/1440 + ',$segundo,'/86400) from dual')	
 	let $result := fn-bea:execute-sql('jdbc/BSCSCORPMAN','result',$sqlstring)
 	let $tratoFecha := hours-from-time(xs:time(xs:dateTime($result))) * 60 + minutes-from-time(xs:time(xs:dateTime($result)))
 	let $concatSeg := concat($tratoFecha,',', seconds-from-time(xs:time(xs:dateTime($result))))
 	return $concatSeg	 
};

declare function xf:XMLTrafficType($DATA as element(DATA))
    as element(TOTAL_TRAF_DET_ITEM) {
        <TOTAL_TRAF_DET_ITEM>
         <CALLDURATION>{
         if(fn:empty($DATA/ROW/DET/TRAF_DET/TRAF_DET_ITEM) or count($DATA/ROW/DET/TRAF_DET/TRAF_DET_ITEM) <=0 ) then
         (
         ''
         )else(
             if('VOZ' = data($DATA/ROW/DET/TRAF_DET/TRAF_DET_ITEM[1]/EVENTTYPE))then
             (
              	xf:sumHhMnSs(
				let $sumHora := for $indice1  in $DATA/ROW/DET/TRAF_DET/TRAF_DET_ITEM
		            let $arg := data($indice1/CALLDURATION)
					let $hora := xs:int(substring-before($arg,':'))
				return $hora
		        return xs:string(sum($sumHora))
		        ,
		        let $sumMinuto := for $indice2  in $DATA/ROW/DET/TRAF_DET/TRAF_DET_ITEM
		            let $arg := data($indice2/CALLDURATION)
					let $minuto := xs:int(substring-before(substring-after($arg, ':'), ':'))
				return $minuto
		        return xs:string(sum($sumMinuto))
		        ,
		        let $sumSeg := for $indice3  in $DATA/ROW/DET/TRAF_DET/TRAF_DET_ITEM
		            let $arg := data($indice3/CALLDURATION)
					let $hora := substring-before($arg,':')
					let $minuto := substring-before(substring-after($arg, ':'), ':')
					let $segundo := xs:int(substring($arg,string-length(concat($hora,$minuto)) +3,string-length($arg)))
				return $segundo
		        return xs:string(sum($sumSeg)) )
             )
             else
             (
              	
				let $sumSms := for $indice1  in $DATA/ROW/DET/TRAF_DET/TRAF_DET_ITEM
		        	let $sms := xs:int(data($indice1/CALLDURATION))
				return $sms
		        return sum($sumSms)
		       
             )

         )
		 
		        
        }
        </CALLDURATION>
        </TOTAL_TRAF_DET_ITEM>
};

declare variable $DATA as element(DATA) external;

xf:XMLTrafficType($DATA)