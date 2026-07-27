

create Table "user"(
    id serial primary key,
    userName varchar(50) not null
)

create Table post(
    id serial primary key,
    title text not null , 
    userId INTEGER REFERENCES "user"(id)
)

alter Table post
     alter column userId set not null;


insert into "user"(userName) values
('John Doe'),
('Jane Smith'),
('Alice Johnson'),
('Bob Brown'),
('Charlie Davis');


select * from "user";


insert into post (title , userid) values
('Post 1', 1),
('Post 2', 1),
('Post 3', 2),
('Post 4', 3),
('Post 5', 3),
('Post 6', 3),
('Post 7', 4),
('Post 8', 5);

INSERT into post VALUES ( 'Post 9', null);

select * from post;

-- ============================================
-- FOREIGN KEY DELETE BEHAVIOR (ALL IN ONE)
-- ============================================

-- STEP 0: CREATE TABLES

CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    userName VARCHAR(50) NOT NULL
);

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    userId INTEGER
);

-- ============================================
-- STEP 1: DEFAULT BEHAVIOR (RESTRICT / NO ACTION)
-- ============================================

-- Add foreign key (default behavior = RESTRICT)
ALTER TABLE post
ADD CONSTRAINT post_userid_fkey
FOREIGN KEY (userId)
REFERENCES "user"(id);

-- Insert sample data
INSERT INTO "user"(userName) VALUES
('User A'), ('User B');

INSERT INTO post(title, userId) VALUES
('Post 1', 1),
('Post 2', 1);

-- Try to delete parent row (will FAIL ❌)
DELETE FROM "user"
WHERE id = 1;

-- Reason: child rows exist in post table


-- ============================================
-- STEP 2: ON DELETE CASCADE
-- ============================================

-- Drop existing constraint
ALTER TABLE post
DROP CONSTRAINT post_userid_fkey;

-- Add CASCADE behavior
ALTER TABLE post
ADD CONSTRAINT post_userid_fkey
FOREIGN KEY (userId)
REFERENCES "user"(id)
ON DELETE CASCADE;

-- Delete user → related posts will be deleted automatically ✅
DELETE FROM "user"
WHERE id = 1;


-- ============================================
-- STEP 3: ON DELETE SET NULL
-- ============================================

-- Make sure column allows NULL
ALTER TABLE post
ALTER COLUMN userId DROP NOT NULL;

-- Drop old constraint
ALTER TABLE post
DROP CONSTRAINT post_userid_fkey;

-- Add SET NULL behavior
ALTER TABLE post
ADD CONSTRAINT post_userid_fkey
FOREIGN KEY (userId)
REFERENCES "user"(id)
ON DELETE SET NULL;

-- Delete user → post.userId becomes NULL ✅
DELETE FROM "user"
WHERE id = 2;


-- ============================================
-- STEP 4: ON DELETE SET DEFAULT
-- ============================================

-- Set default value for userId
ALTER TABLE post
ALTER COLUMN userId SET DEFAULT 1;

-- Drop old constraint
ALTER TABLE post
DROP CONSTRAINT post_userid_fkey;

-- Add SET DEFAULT behavior
ALTER TABLE post
ADD CONSTRAINT post_userid_fkey
FOREIGN KEY (userId)
REFERENCES "user"(id)
ON DELETE SET DEFAULT;

-- Delete user → post.userId becomes default value (1) ✅
DELETE FROM "user"
WHERE id = 3;


-- ============================================
-- STEP 5: MANUAL DELETE (SAFE PRACTICE)
-- ============================================

-- First delete child rows
DELETE FROM post
WHERE userId = 4;

-- Then delete parent row
DELETE FROM "user"
WHERE id = 4;


-- ============================================
-- STEP 6: CHECK BEFORE DELETE (BEST PRACTICE)
-- ============================================

-- Check related posts before deleting a user
SELECT *
FROM post
WHERE userId = 5;