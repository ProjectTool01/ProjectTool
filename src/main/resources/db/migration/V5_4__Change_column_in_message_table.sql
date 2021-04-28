alter table message drop constraint message_to_user_fkey;

alter table message drop column to_user;

alter table message add column to_project int8 references project;
