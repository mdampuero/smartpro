CREATE TABLE `sg_productors` (
  `pr_id` int(11) NOT NULL,
  `pr_name` varchar(128) NOT NULL,
  `pr_phone` varchar(64) NOT NULL,
  `pr_email` varchar(64) NOT NULL,
  `pr_password` varchar(128) NOT NULL,
  `pr_observation` text NOT NULL,
  `pr_status` tinyint(4) NOT NULL,
  `pr_created` varchar(64) NOT NULL,
  `pr_modified` varchar(64) NOT NULL,
  `pr_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `sg_productors` ADD PRIMARY KEY (`pr_id`);
ALTER TABLE `sg_productors`  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;