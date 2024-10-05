class ChecklistItem {
  final String title;
  bool isChecked;

  ChecklistItem({required this.title, this.isChecked = false});
}

List<ChecklistItem> removalChecklistItems = [
  ChecklistItem(title: 'Master switch and ignition switch in OFF position.'),
  ChecklistItem(title: 'Position the MIXTURE control on "LEAN."'),
  ChecklistItem(
      title: 'Remove the screws (7) securing the spinner to the back plate.'),
  ChecklistItem(title: 'Remove the spinner.'),
  ChecklistItem(
      title: 'Cut the locking wire securing the propeller attachment bolts.'),
  ChecklistItem(
      title:
          'Remove the bolts, propeller, and back plate (1), noting how each item is fitted.'),
];

// Data for the "Cleaning & Inspection" checklist
List<ChecklistItem> cleaningInspectionChecklistItems = [
  ChecklistItem(
      title:
          'Clean the spinner, back plate, and propeller assembly with a non-corrosive solvent.'),
  ChecklistItem(
      title:
          'Inspect the propeller hub and bolt holes for wear, impact, cracks, or other defects.'),
  ChecklistItem(
      title:
          'Inspect the blades for defects such as cracks, scratches, impact marks, wear, or separation of coating material.'),
];

List<ChecklistItem> installationChecklistItems = [
  ChecklistItem(
      title:
          'Clean the crankshaft flange, pilot stub, rear face of the propeller hub, and pilot bore.'),
  ChecklistItem(title: 'Position the back plate and propeller.'),
  ChecklistItem(
      title:
          'Secure with 6 bolts and washers (ensure bolt threads are clean and dry).'),
  ChecklistItem(
      title:
          'Torque bolts using a crisscross tightening sequence (secure bolts with locking wire, see torque loading table 2.5).'),
  ChecklistItem(
      title: 'Check the blade track (should be within 1.5 mm or 1/16 inch).'),
  ChecklistItem(
      title:
          'Position and secure the spinner on the back plate with screws (ensure the fiber washer is under the screw heads).'),
];

// Data for the "Minor Repair" checklist
List<ChecklistItem> minorRepairChecklistItems = [
  ChecklistItem(
      title:
          'Round out shallow nicks or cuts (ensure blade strength, weight, and stiffness are not affected).'),
];

// Data for the "Major Repair" checklist
List<ChecklistItem> majorRepairChecklistItems = [
  ChecklistItem(
      title:
          'Diameter reduction for tip damage repair (within manufacturer\'s limits, see Table 2.3 \'PROPELLER\').'),
  ChecklistItem(title: 'Repair deep cuts or nicks.'),
  ChecklistItem(title: 'Straighten bent blades.'),
  ChecklistItem(
      title: 'Blend out nicks and dents with fine aluminum oxide paper.'),
  ChecklistItem(
      title:
          'For damaged blade tips, ensure both tips are treated equally for balance.'),
  ChecklistItem(
      title: 'If hub bore or bolt holes are oval, contact the manufacturer.'),
  ChecklistItem(
      title: 'Treat bare metal with Alodine or similar product after repairs.'),
];
