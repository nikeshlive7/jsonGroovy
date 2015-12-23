package json

import org.codehaus.groovy.grails.web.json.JSONObject

import javax.servlet.ServletException
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse


class JsonController {

        def data(){


            StringBuilder sb = new StringBuilder();
            BufferedReader br = request.getReader();
            String str1;
            while( (str1 = br.readLine()) != null ){
                sb.append(str1);
            }
            JSONObject jObj = new JSONObject(sb.toString());



            //assigning json to map
            def map = jObj


            //printing map key value pair

            Set<Map.Entry<String, String>> entrySet = map.entrySet()
            Iterator<String> itr = map.keySet().iterator()
            Collection<String> col = map.values();

            print "\n \n this is set"

            for (Map.Entry<String, String> entry : entrySet) {

               // Worker worker = entry.getValue();
                print entry.key+"   :    "+ entry.value
            }


            print "\n \n this is iterator"
            while(itr.hasNext()){
                println itr.next()
            }

            print "\n \n this is collection"
            for(String str:col){
                println(str)

            }







            JSONObject jsonObject=new JSONObject()
            jsonObject.put('key1','value1')
            jsonObject.put('key2','value2')
            jsonObject.put('key3','value3')
            jsonObject.put('key4','value4')

            render jsonObject

//        response.setContentType("application/json");
//        response.getWriter().write("{\"key\":\"hello\",\"key2\":\"world\"}");

    }


}
