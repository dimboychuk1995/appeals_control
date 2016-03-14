package oe.roma.appeals.reports;

import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.write.*;
import jxl.write.Number;
import oe.roma.appeals.domain.Appeal;
import org.springframework.web.servlet.view.document.AbstractJExcelView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by us8610 on 03.06.14.
 */
@SuppressWarnings("unchecked")
public class ListOffControlD3Builder extends AbstractJExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> model,
                                      WritableWorkbook workbook, HttpServletRequest request,
                                      HttpServletResponse response) throws Exception {

        // get data model which is passed by the Spring container
        List<Appeal> list = (List<Appeal>) model.get("list");
        String year = (String) model.get("year");
        String month = (String) model.get("month");

        DateFormat customDateFormat = new DateFormat ("dd.MM.yyyy");

        WritableCellFormat dateFormat = new WritableCellFormat (customDateFormat);

        //для рєєстр
        WritableFont cellFont = new WritableFont(WritableFont.TIMES, 12);
        WritableCellFormat cellFormat = new WritableCellFormat(cellFont);

        //для контроролю
        WritableFont cellFont1 = new WritableFont(WritableFont.TIMES, 12);
        WritableCellFormat cellFormat1 = new WritableCellFormat(cellFont1); //для контроролю

        WritableFont cellFont2 = new WritableFont(WritableFont.TIMES, 10);
        WritableCellFormat normal = new WritableCellFormat(cellFont2);
        normal.setBorder(Border.ALL, BorderLineStyle.THIN);


        cellFormat.setAlignment(Alignment.CENTRE);
        cellFormat.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);

        cellFormat1.setAlignment(Alignment.CENTRE);
        cellFormat1.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);

        normal.setAlignment(Alignment.CENTRE);
        normal.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
        normal.setWrap(true);

        dateFormat.setAlignment(Alignment.CENTRE);
        dateFormat.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
        dateFormat.setBorder(Border.ALL, BorderLineStyle.THIN);

        // create a new Excel sheet

        WritableSheet sheet = workbook.createSheet("report1", 0);
        sheet.mergeCells(0,0,5,0);
        sheet.mergeCells(0,1,5,1);
        sheet.mergeCells(0,2,5,2);
        sheet.mergeCells(0,5,5,5);
        sheet.mergeCells(6,5,9,5);
        sheet.mergeCells(10,5,11,5);

        sheet.mergeCells(6,0,7,1);//Знято з контролю (відповіді не надано)

        sheet.addCell(new Label(0, 0, "РЕЄСТР", cellFormat));
        sheet.addCell(new Label(6, 0, "Знято з контролю (відповіді надано)", cellFormat));
        sheet.addCell(new Label(0, 1, "контролю термінів надання відповідей на звернення", cellFormat1));
        sheet.addCell(new Label(0,2,"за "+month+" "+year+" року",cellFormat1));
        sheet.addCell(new Label(0,5,"Лист",normal));
        sheet.addCell(new Label(6,5,"Відповідь",normal));
        sheet.addCell(new Label(10,5,"Контроль",normal));
        int start=6;
        sheet.addCell(new Label(0, start, "Вх.№",normal));
        sheet.addCell(new Label(1, start, "Дата",normal));
        sheet.addCell(new Label(2, start, "Від кого",normal));
        sheet.addCell(new Label(3, start, "Зміст звернення",normal));
        sheet.addCell(new Label(4, start, "Вид звернення",normal));
        sheet.addCell(new Label(5, start, "Призначений виконавець",normal));

        sheet.addCell(new Label(6, start, "Вих.№",normal));
        sheet.addCell(new Label(7, start, "Дата",normal));
        sheet.addCell(new Label(8, start, "За підписом",normal));
        sheet.addCell(new Label(9, start, "Зміст відповіді",normal));

        sheet.addCell(new Label(10, start, "Термін надання відповіді, дн.",normal));
        sheet.addCell(new Label(11, start, "Кінцевий термін",normal));
        for(int i=0;i<12;i++)
            sheet.setColumnView(i,40);
        // create data rows
        int rowCount = start+1;

        for (Appeal appeal : list) {
            sheet.addCell(new Label(0, rowCount, appeal.getIn_number(),normal));
            sheet.addCell(new DateTime(1, rowCount, appeal.getIn_date(),dateFormat));
            sheet.addCell(new Label(2, rowCount, appeal.getCustomer(),normal));
            sheet.addCell(new Label(3, rowCount, appeal.getText_appeal(),normal));
            sheet.addCell(new Label(4, rowCount, appeal.getType_appeal().getName(),normal));
            sheet.addCell(new Label(5, rowCount, appeal.getExecutor(),normal));

            sheet.addCell(new Label(6, rowCount, appeal.getOut_number(),normal));
            sheet.addCell(appeal.getOut_date()== null ? new Blank (7,rowCount,normal) : new DateTime(7, rowCount,appeal.getOut_date(),dateFormat));
            sheet.addCell(appeal.getSignature()==null ? new Blank (8,rowCount,normal) :new Label(8, rowCount, appeal.getSignature().getSignature(),normal));
            sheet.addCell(new Label(9, rowCount, appeal.getText_answer(),normal));

            sheet.addCell(appeal.getTerm_answer()== null ? new Blank (10,rowCount,normal) :new Number(10, rowCount, appeal.getTerm_answer(),normal));
            sheet.addCell(appeal.getDeadline_term()== null ? new Blank (11,rowCount,normal) : new DateTime(11, rowCount,appeal.getDeadline_term(),dateFormat));

            rowCount++;
        }
    }
}
