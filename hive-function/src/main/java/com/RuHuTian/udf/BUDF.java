package com.RuHuTian.udf;


import jodd.util.StringUtil;
import org.apache.hadoop.hive.ql.exec.UDF;
import org.json.JSONException;
import org.json.JSONObject;

public class BUDF extends UDF {

    public String evaluate(String line, String key) throws JSONException {
        String[] strings = line.split("\\|");
        if (strings.length!=2|| StringUtil.isBlank(strings[1].trim())){
            return "";
        }

        JSONObject jsonObject = new JSONObject(strings[1]);
        if (key.equals("st")){
            return strings[0];
        }

        if (jsonObject.has(key)){
            return jsonObject.getString(key);
        }else {
            return "";
        }

    }

}
