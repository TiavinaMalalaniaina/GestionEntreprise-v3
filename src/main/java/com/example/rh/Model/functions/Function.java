package com.example.rh.Model.functions;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.util.Calendar;

public class Function {

    public Timestamp getDateActuel() {
        Calendar calendar = Calendar.getInstance();
        java.util.Date utilDate = calendar.getTime();
        return new Timestamp(utilDate.getTime());
    }

    public  Timestamp convertStringEnTimestamp(String date) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date dateUtil = simpleDateFormat.parse(date);
        Timestamp dateSql = new Timestamp(dateUtil.getTime());
        return dateSql;
    }

    /* maka ny nombre heures entres izao sy ilay date de besoin */
    public double intervaleDeuxDate(Timestamp date1, Timestamp date2) {
        long differenceEnMilliSecond = date2.getTime() - date1.getTime();
        double differenceEnHeures = (double) differenceEnMilliSecond / 3600000;
        return differenceEnHeures;
    }

    public double pourcentageProgressDate(Timestamp dateInsertion, Timestamp dateBesoin) {
        double diff1 = intervaleDeuxDate(dateInsertion, dateBesoin);
        double diff2 = intervaleDeuxDate(dateInsertion, getDateActuel());

        double p = diff2 / diff1 * 100.0;

        return p;
    }
}
