PGDMP      ;            	    |            AmbulanciasYa    16.4    16.4 '    7           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            8           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            9           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            :           1262    16409    AmbulanciasYa    DATABASE     �   CREATE DATABASE "AmbulanciasYa" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "AmbulanciasYa";
                postgres    false                        3079    16501 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            ;           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            r           1247    16521    estado    TYPE     >   CREATE TYPE public.estado AS ENUM (
    'Alta',
    'Baja'
);
    DROP TYPE public.estado;
       public          postgres    false            u           1247    16529 
   tipoestado    TYPE     B   CREATE TYPE public.tipoestado AS ENUM (
    'Alta',
    'Baja'
);
    DROP TYPE public.tipoestado;
       public          postgres    false            �            1259    16441 	   Accidente    TABLE     �  CREATE TABLE public."Accidente" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    direccion text NOT NULL,
    descripcion text NOT NULL,
    "requiereTraslado" boolean NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    "ambulanciaID" uuid NOT NULL,
    "reporteID" uuid NOT NULL,
    "hospitalID" uuid NOT NULL,
    "reportanteID" uuid NOT NULL,
    "pacienteID" uuid NOT NULL
);
    DROP TABLE public."Accidente";
       public         heap    postgres    false    2            �            1259    16424 
   Ambulancia    TABLE     P  CREATE TABLE public."Ambulancia" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    patente text NOT NULL,
    inventario boolean NOT NULL,
    vtv boolean NOT NULL,
    seguro boolean NOT NULL,
    "paramedicoID" uuid NOT NULL,
    estado public.tipoestado DEFAULT 'Alta'::public.tipoestado,
    "choferID" uuid NOT NULL
);
     DROP TABLE public."Ambulancia";
       public         heap    postgres    false    2    885    885            �            1259    16410    Chofer    TABLE     �   CREATE TABLE public."Chofer" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "nombreCompleto" text NOT NULL,
    dni text NOT NULL,
    estado public.tipoestado DEFAULT 'Alta'::public.tipoestado
);
    DROP TABLE public."Chofer";
       public         heap    postgres    false    2    885    885            �            1259    16460    Hospital    TABLE     �   CREATE TABLE public."Hospital" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    nombre text NOT NULL,
    direccion text NOT NULL
);
    DROP TABLE public."Hospital";
       public         heap    postgres    false    2            �            1259    16474    Paciente    TABLE     �   CREATE TABLE public."Paciente" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "nombreCompleto" text NOT NULL,
    telefono text NOT NULL
);
    DROP TABLE public."Paciente";
       public         heap    postgres    false    2            �            1259    16417 
   Paramedico    TABLE     �   CREATE TABLE public."Paramedico" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "nombreCompleto" text NOT NULL,
    dni text NOT NULL,
    estado public.tipoestado DEFAULT 'Alta'::public.tipoestado
);
     DROP TABLE public."Paramedico";
       public         heap    postgres    false    2    885    885            �            1259    16467 
   Reportante    TABLE     �   CREATE TABLE public."Reportante" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "nombreCompleto" text,
    telefono text
);
     DROP TABLE public."Reportante";
       public         heap    postgres    false    2            �            1259    16453    Reporte    TABLE     �   CREATE TABLE public."Reporte" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    descripcion text NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL
);
    DROP TABLE public."Reporte";
       public         heap    postgres    false    2            0          0    16441 	   Accidente 
   TABLE DATA           �   COPY public."Accidente" (id, direccion, descripcion, "requiereTraslado", fecha, hora, "ambulanciaID", "reporteID", "hospitalID", "reportanteID", "pacienteID") FROM stdin;
    public          postgres    false    219   0       /          0    16424 
   Ambulancia 
   TABLE DATA           p   COPY public."Ambulancia" (id, patente, inventario, vtv, seguro, "paramedicoID", estado, "choferID") FROM stdin;
    public          postgres    false    218   )0       -          0    16410    Chofer 
   TABLE DATA           E   COPY public."Chofer" (id, "nombreCompleto", dni, estado) FROM stdin;
    public          postgres    false    216   F0       2          0    16460    Hospital 
   TABLE DATA           ;   COPY public."Hospital" (id, nombre, direccion) FROM stdin;
    public          postgres    false    221   M1       4          0    16474    Paciente 
   TABLE DATA           D   COPY public."Paciente" (id, "nombreCompleto", telefono) FROM stdin;
    public          postgres    false    223   j1       .          0    16417 
   Paramedico 
   TABLE DATA           I   COPY public."Paramedico" (id, "nombreCompleto", dni, estado) FROM stdin;
    public          postgres    false    217   t2       3          0    16467 
   Reportante 
   TABLE DATA           F   COPY public."Reportante" (id, "nombreCompleto", telefono) FROM stdin;
    public          postgres    false    222   v3       1          0    16453    Reporte 
   TABLE DATA           A   COPY public."Reporte" (id, descripcion, fecha, hora) FROM stdin;
    public          postgres    false    220   e4       �           2606    16447    Accidente Accidente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Accidente"
    ADD CONSTRAINT "Accidente_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Accidente" DROP CONSTRAINT "Accidente_pkey";
       public            postgres    false    219            �           2606    16430    Ambulancia Ambulancia_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Ambulancia"
    ADD CONSTRAINT "Ambulancia_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Ambulancia" DROP CONSTRAINT "Ambulancia_pkey";
       public            postgres    false    218            �           2606    16416    Chofer Chofer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Chofer"
    ADD CONSTRAINT "Chofer_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Chofer" DROP CONSTRAINT "Chofer_pkey";
       public            postgres    false    216            �           2606    16466    Hospital Hospital_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Hospital"
    ADD CONSTRAINT "Hospital_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Hospital" DROP CONSTRAINT "Hospital_pkey";
       public            postgres    false    221            �           2606    16480    Paciente Paciente_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Paciente"
    ADD CONSTRAINT "Paciente_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Paciente" DROP CONSTRAINT "Paciente_pkey";
       public            postgres    false    223            �           2606    16423    Paramedico Paramedico_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Paramedico"
    ADD CONSTRAINT "Paramedico_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Paramedico" DROP CONSTRAINT "Paramedico_pkey";
       public            postgres    false    217            �           2606    16473    Reportante Reportante_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Reportante"
    ADD CONSTRAINT "Reportante_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Reportante" DROP CONSTRAINT "Reportante_pkey";
       public            postgres    false    222            �           2606    16459    Reporte Reporte_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Reporte"
    ADD CONSTRAINT "Reporte_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Reporte" DROP CONSTRAINT "Reporte_pkey";
       public            postgres    false    220            �           2606    16448 %   Accidente Accidente_ambulanciaID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Accidente"
    ADD CONSTRAINT "Accidente_ambulanciaID_fkey" FOREIGN KEY ("ambulanciaID") REFERENCES public."Ambulancia"(id) NOT VALID;
 S   ALTER TABLE ONLY public."Accidente" DROP CONSTRAINT "Accidente_ambulanciaID_fkey";
       public          postgres    false    219    218    4748            �           2606    16491 #   Accidente Accidente_hospitalID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Accidente"
    ADD CONSTRAINT "Accidente_hospitalID_fkey" FOREIGN KEY ("hospitalID") REFERENCES public."Hospital"(id) NOT VALID;
 Q   ALTER TABLE ONLY public."Accidente" DROP CONSTRAINT "Accidente_hospitalID_fkey";
       public          postgres    false    4754    219    221            �           2606    16481 #   Accidente Accidente_pacienteID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Accidente"
    ADD CONSTRAINT "Accidente_pacienteID_fkey" FOREIGN KEY ("pacienteID") REFERENCES public."Paciente"(id) NOT VALID;
 Q   ALTER TABLE ONLY public."Accidente" DROP CONSTRAINT "Accidente_pacienteID_fkey";
       public          postgres    false    223    219    4758            �           2606    16486 %   Accidente Accidente_reportanteID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Accidente"
    ADD CONSTRAINT "Accidente_reportanteID_fkey" FOREIGN KEY ("reportanteID") REFERENCES public."Reportante"(id) NOT VALID;
 S   ALTER TABLE ONLY public."Accidente" DROP CONSTRAINT "Accidente_reportanteID_fkey";
       public          postgres    false    222    219    4756            �           2606    16496 "   Accidente Accidente_reporteID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Accidente"
    ADD CONSTRAINT "Accidente_reporteID_fkey" FOREIGN KEY ("reporteID") REFERENCES public."Reporte"(id) NOT VALID;
 P   ALTER TABLE ONLY public."Accidente" DROP CONSTRAINT "Accidente_reporteID_fkey";
       public          postgres    false    4752    219    220            �           2606    16536 #   Ambulancia Ambulancia_choferID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ambulancia"
    ADD CONSTRAINT "Ambulancia_choferID_fkey" FOREIGN KEY ("choferID") REFERENCES public."Chofer"(id) NOT VALID;
 Q   ALTER TABLE ONLY public."Ambulancia" DROP CONSTRAINT "Ambulancia_choferID_fkey";
       public          postgres    false    216    218    4744            �           2606    16436 '   Ambulancia Ambulancia_paramedicoID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ambulancia"
    ADD CONSTRAINT "Ambulancia_paramedicoID_fkey" FOREIGN KEY ("paramedicoID") REFERENCES public."Paramedico"(id) NOT VALID;
 U   ALTER TABLE ONLY public."Ambulancia" DROP CONSTRAINT "Ambulancia_paramedicoID_fkey";
       public          postgres    false    218    217    4746            0      x������ � �      /      x������ � �      -   �   x�-�1N�0�:9E.0��8O�B	���i��!�,
l��ْb+���a�t��o�Z� )�>��"ID՚S.�{8�<<�?��;�Џ�bw����8��G���bQ�`Zb_�J�$�z���8���Ԍ���U$#ؒxK)ږ���Va���2���X��o���c	�
O� �2��$3QŘ��,������{�nmK;cC�x�����FN�)�6�����p�˼^�Ґ�p�z�����_      2      x������ � �      4   �   x�-�1N1�zr���Q�3��f�V��8�#hfQ�6܆�b+�0#��r�߷m��*+�P2��H���Q�����~�����;��BqM�|c�<�X������"�B~:^�~��Q�m��0 �D��Q�#qȉ+�%J32㐧��M�z�����}�!�0��9�JQ��B������DBu:��|��=?�i�t5zƄ�U +Ȁ����>"�L��E���e����ݸ� ������\      .   �   x�=�MJA�u�)�%�S��*��&�tS�Ub:ƅw�)r12������Pm��1@],���aSU�k�]iޯ�o��E~U����F��4q����5Ł�����|N%R��+�,�緵�Q�*o�]8��o�}3�~�)�N>i�Y$�z��%�yY�l���2Yd�dt��PaH���"�u~�ޥ����q-H	cT����R9�!�.��('�?��������4MaY�      3   �   x�-�;N1�x|��@#��ݝ#��&���VZv��p'�=�\�*�z�� �A���+(F�i4ߔ��ˣ^��|x�o��s�1B�)�l��X�<��$�dsJi�&���m9>�8�VH� I�i�cP�B)7M=�_^���.'�������&&.����@��n�L> ��^�Xҿ&�B�B
r����&IK]^�ڷ���|=m��j+01�wιo@-L�      1      x������ � �     