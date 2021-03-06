package oe.roma.appeals.reports;

import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.write.*;
import jxl.write.Number;
import org.springframework.web.servlet.view.document.AbstractJExcelView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by us8610 on 03.06.14.
 */
@SuppressWarnings("unchecked")
public class MainReportD2Builder extends AbstractJExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> model,
                                      WritableWorkbook workbook, HttpServletRequest request,
                                      HttpServletResponse response) throws Exception {

        // get data model which is passed by the Spring container
        Map<String,Integer> list = (Map<String,Integer>) model.get("list");
        List<Map.Entry<String,Integer>> report = new ArrayList<Map.Entry<String,Integer>>(list.entrySet());;

        String year = (String) model.get("year");

        String month = (String) model.get("month");

        DateFormat customDateFormat = new DateFormat ("dd.MM.yyyy");

        WritableCellFormat dateFormat = new WritableCellFormat (customDateFormat);

        //для рєєстр
        WritableFont cellFont = new WritableFont(WritableFont.TIMES, 12,WritableFont.BOLD);
        WritableCellFormat main = new WritableCellFormat(cellFont);

        //для контроролю
        WritableCellFormat header = new WritableCellFormat(cellFont); //для контроролю
        header.setBorder(Border.ALL, BorderLineStyle.THIN);

        WritableFont text1 = new WritableFont(WritableFont.TIMES, 12);
        WritableCellFormat normal = new WritableCellFormat(text1);
        normal.setBorder(Border.ALL, BorderLineStyle.THIN);

        WritableFont text2 = new WritableFont(WritableFont.TIMES, 12);
        text2.setItalic(true);
        WritableCellFormat normal1 = new WritableCellFormat(text2);
        normal1.setBorder(Border.ALL, BorderLineStyle.THIN);
        normal1.setWrap(true);

        WritableCellFormat normal2 = new WritableCellFormat(text2);
        normal2.setBorder(Border.ALL, BorderLineStyle.THIN);
        normal2.setAlignment(Alignment.CENTRE);
        normal2.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);

        main.setAlignment(Alignment.CENTRE);
        main.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);

        header.setAlignment(Alignment.CENTRE);
        header.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);

        normal.setAlignment(Alignment.CENTRE);
        normal.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
        normal.setWrap(true);



        // create a new Excel sheet

        WritableSheet sheet = workbook.createSheet("Зведений звіт", 0);
        sheet.mergeCells(0,0,1,0);
        sheet.mergeCells(0,1,1,1);//Відповіді не надано

        sheet.addCell(new Label(0, 0, "Інформація", main));
        sheet.addCell(new Label(0, 1, "про дотримання термінів надання відповідей", main));

        sheet.addCell(new Label(0, 5, "Період", header));
        sheet.addCell(new Label(1,5,month+" "+year+" року",header));

        int start=5;



        for(int i=0;i<2;i++)
            sheet.setColumnView(i,40);
        // create data rows
        int rowCount = start+1;

            sheet.addCell(new Label(0, rowCount, report.get(0).getKey(),normal));
            sheet.addCell(new Number(1, rowCount, report.get(0).getValue(),normal));
            rowCount++;

            //if(list.size()>5){
                sheet.addCell(new Label(0, rowCount, "з них",normal1));
                sheet.addCell(new Blank(1, rowCount++,normal));
                for(int i=1; i<list.size();i++){
                    sheet.addCell(new Label(0, rowCount, report.get(i).getKey(),i>list.size()-1-4? normal:normal1));
                    sheet.addCell(new Number(1, rowCount, report.get(i).getValue(),normal));
                    rowCount++;
                }

       // }
    }
}
