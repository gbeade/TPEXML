
<results>{


if( count( doc("data.xml")/ClientError ) > 0 ) then (
	<error>{doc("data.xml")/ClientError/message/fn:string()}</error>
)else (
for $var in doc("countries.xml")/countries/country
where $var/@alpha-2=doc("data.xml")/cities/list/item/city/country 
order by $var/@name
return <country alpha-2="{$var/@alpha-2}">
       <name>{$var/@name/fn:string()}</name>
       <cities>{
            for $var1 in doc("data.xml")/cities/list/item
            where $var1/city/country=$var/@alpha-2
            return <city> 
                    <name>{$var1/city/@name/fn:string()}</name>
                    <temperature unit="{$var1/temperature/@unit}">{$var1/temperature/@value/fn:string()}</temperature>
                    <feels_like unit="{$var1/feels_like/@unit}">{$var1/feels_like/@value/fn:string()}</feels_like>
                    <humidity unit="{$var1/humidity/@unit}">{$var1/humidity/@value/fn:string()}</humidity>
                    <pressure unit="{$var1/pressure/@unit}">{$var1/temperature/@value/fn:string()}</pressure>
                    <clouds>{$var1/clouds/@name/fn:string()}</clouds>
                    <weather icon="{$var1/weather/@icon}">{$var1/weather/@value/fn:string()}</weather>
                </city>
        }</cities>
        </country> 
)
}</results> 



