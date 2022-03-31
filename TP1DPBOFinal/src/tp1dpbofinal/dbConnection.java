/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tp1dpbofinal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author dell
 */
public class dbConnection {
    public static Connection con;
    public static Statement stm;
    
    public void connect (){
        try{
            String url = "jdbc:mysql://localhost/db_tp1";
            String user = "root";
            String pass = "";
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);
            stm = con.createStatement();
            System.out.println("Koneksi Berhasil!");
  
        } catch(Exception e){
            System.err.println("Koneksi Gagal" + e.getMessage());
        }
    }
    public DefaultTableModel readTableAutor(){
        DefaultTableModel dataTabel = null;
        try{
            Object [] column = {"id_autor", "Nama", "Jumlah_buku", "img_autor"};
            connect();
            dataTabel = new DefaultTableModel(null, column);
            String autor = "Select id_autor, nama_autor, jumlah_buku, img_autor from autor";
         
            ResultSet resAutor = stm.executeQuery(autor);
     
            int no=1;
            while(resAutor.next()){
                Object [] hasil = new Object[4];
                hasil[0] = resAutor.getString("id_autor");
                hasil[1] = resAutor.getString("nama_autor");
                hasil[2] = resAutor.getString("jumlah_buku");
                hasil[3] = resAutor.getString("img_autor");
                no++;
                dataTabel.addRow(hasil);
            }
        } catch(Exception e){
            System.err.println("Read Gagal haha" + e.getMessage());
        }
        return dataTabel;
       
    }
    public Statement getStm(){
       return this.stm;
   }
      public DefaultTableModel readTableBuku(){
        DefaultTableModel dataTabel = null;
        try{
            Object [] column = {"id_autor", "img_buku", "penerbit_buku", "autor_buku", "desc_buku"};
            connect();
            dataTabel = new DefaultTableModel(null, column);
            
            String buku = "Select id_buku, img_buku, penerbit_buku, autor_buku, Desc_buku from buku";
            ResultSet resBuku = stm.executeQuery(buku);
            int no=1;
            while(resBuku.next()){
                Object [] hasil = new Object[5];
                hasil[0] = resBuku.getInt("id_buku");
                hasil[1] = resBuku.getString("img_buku");
                hasil[2] = resBuku.getString("penerbit_buku");
                hasil[3] = resBuku.getString("autor_buku");
                hasil[4] = resBuku.getString("Desc_buku");
                no++;
                dataTabel.addRow(hasil);
            }
        } catch(Exception e){
            System.err.println("Read Gagal haha" + e.getMessage());
        }
        return dataTabel;
      }
    public void query(String inputan){
        try{
            connect();
            String sql = inputan;
            stm.execute(sql);
        }catch(Exception e){
            System.err.println("Read Gagal!!" + e.getMessage());
        }
    }
}