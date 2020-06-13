using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Payment.Models
{
    public partial class PaymentContext : DbContext
    {  

        public PaymentContext(DbContextOptions<PaymentContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Discount> Discount { get; set; }
        public virtual DbSet<Installation> Installation { get; set; }
        public virtual DbSet<Country> Country { get; set; }
        public virtual DbSet<Frequency> Frequency { get; set; }
        public virtual DbSet<Hardware> Hardware { get; set; }
        public virtual DbSet<Package> Package { get; set; }
        public virtual DbSet<PaymentMethod> PaymentMethod { get; set; }
        public virtual DbSet<PackageHardware> PackageHardware { get; set; }

        //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        //{
        //    if (!optionsBuilder.IsConfigured)
        //    {
        //        optionsBuilder.UseSqlServer();
        //    }
        //}

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Discount>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifyOn).HasColumnType("datetime");

                entity.HasOne(d => d.Frequency)
                    .WithMany(p => p.Discount)
                    .HasForeignKey(d => d.FrequencyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Discount_Frequency_FrequencyId");

                entity.HasOne(d => d.Package)
                    .WithMany(p => p.Discount)
                    .HasForeignKey(d => d.PackageId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Discount_Package_PackageId");
            });

            modelBuilder.Entity<Installation>(entity =>
            {

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifyOn).HasColumnType("datetime");

                entity.Property(e => e.Price).HasColumnType("numeric(8, 2)");

                entity.HasOne(d => d.Package)
                    .WithMany(p => p.Installation)
                    .HasForeignKey(d => d.PackageId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Istallation_Package_PackageId");
            });

            modelBuilder.Entity<Country>(entity =>
            {
                entity.ToTable("LookUpCountry");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifyOn).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(200);
            });

            modelBuilder.Entity<Frequency>(entity =>
            {
                entity.ToTable("LookUpFrequency");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifyOn).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(200);
            });

            modelBuilder.Entity<Hardware>(entity =>
            {
                entity.ToTable("LookUpHardware");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifyOn).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.Price).HasColumnType("numeric(8, 2)");
            });

            modelBuilder.Entity<Package>(entity =>
            {
                entity.ToTable("LookUpPackage");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifyOn).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.Price).HasColumnType("numeric(8, 2)");
            });

            modelBuilder.Entity<PaymentMethod>(entity =>
            {
                entity.ToTable("LookUpPaymentMethod");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifyOn).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(200);
            });

            modelBuilder.Entity<PackageHardware>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ModifyOn).HasColumnType("datetime");

                entity.HasOne(d => d.Hardware)
                    .WithMany(p => p.PackageHardware)
                    .HasForeignKey(d => d.HardwareId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PackageHardware_Hardware_HardwareId");

                entity.HasOne(d => d.Package)
                    .WithMany(p => p.PackageHardware)
                    .HasForeignKey(d => d.PackageId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PackageHardware_Package_PackageId");
            });
        }
    }
}
