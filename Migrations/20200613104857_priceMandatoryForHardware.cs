using Microsoft.EntityFrameworkCore.Migrations;

namespace Payment.Migrations
{
    public partial class priceMandatoryForHardware : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<decimal>(
                name: "Price",
                table: "LookUpPackage",
                type: "numeric(8, 2)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "numeric(8, 2)",
                oldNullable: true);

            migrationBuilder.AlterColumn<decimal>(
                name: "Price",
                table: "LookUpHardware",
                type: "numeric(8, 2)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "numeric(8, 2)",
                oldNullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<decimal>(
                name: "Price",
                table: "LookUpPackage",
                type: "numeric(8, 2)",
                nullable: true,
                oldClrType: typeof(decimal),
                oldType: "numeric(8, 2)");

            migrationBuilder.AlterColumn<decimal>(
                name: "Price",
                table: "LookUpHardware",
                type: "numeric(8, 2)",
                nullable: true,
                oldClrType: typeof(decimal),
                oldType: "numeric(8, 2)");
        }
    }
}
