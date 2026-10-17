# FIX-RT-RS-01~2 — handoff

Codex, session `codex-4EkcIG`, 17 October 2026; issue #8931. **The job is complete and awaits REV-FIX-RT-RS-01~2, not a continuation of the owner decision.** No second job was taken. The full account is [RT-RS-01.fixes-2.md](../redteam/RT-RS-01.fixes-2.md).

## Done

- Resolved the sole remaining finding /30: R07.3 owns rational FL admissibility/period comparison, R06.4 imports them; R06.3 owns general perfect-residue CF, R06.2 keeps its statement interface and R07.4 imports the proof while retaining Kisin’s construction/comparison.
- Updated P7 restructure entries 8/12 and actual R06.4 proof steps/prerequisites. Added the general CF theorem and its specialized fundamental-lifting theorem, with original-source statements, proof route, hypotheses and negative controls. The existing finite-Q_p Berger route is distinguished from general CF.
- Reparented `R06.2/crystalline-equivalence-over-breve-base` and `R06.2/fixed-bound-fiber-functor-triviality` to R06.3, retaining IDs. The torsor proof gap remains independent of CF.
- Recorded both owners, four total narrowed stages, and all forwarded consumers in RS-01: 27 layer records, 23 owners, 50 links. Corrected historical report claims without issuing a new review verdict. Existing JSON review objects/histories are unchanged.
- Checkers pass, as do file intake and whitespace checks. Assembly and the union of raw stage proposals are acyclic; the fixes report records the pre-existing whole-draft projection cycles. All 300 old node IDs, 640 API entries and 373 definition tests are retained; P7 now has 302 nodes and 25 disclosed gaps. No Lean file changed or compiled.

## Independent review and owning roadmap follow-up

The reviewer should assess the two new contracts, source scopes and forwarding. Read the CF **35-page author copy** at its recorded URL/hash; its pagination differs from the 43-page journal article. Check FL Theorem 8.4 on pp. 595–596, especially the dual convention and rational/torsion range distinction. The prior independent review explicitly permitted this bounded follow-up without rechecking its other 31 finding assessments.

The external R07 packet and reader/suggested files were outside this issue’s five-file allowlist. Their owners should apply these precise synchronization instructions after acceptance:

1. Keep `R07.3/fl-admissibility`, `fl-period-comparison` and the lattice correspondence’s local admissibility prerequisite in the early stage. R06.4’s exact imports are already in P7. Do not add R06.4 → R07.3. Preserve the Fontaine [F2] §4 period-ring proof gap and the separate all-stable-lattice essential-image gap; Proposition 7.17 proves neither away.
2. In `R07.4/semistable-finite-height`, replace the general CF proof/consequence by an import of `PadicHodgeTheory:R06.3/colmez-fontaine-perfect-residue`. Keep the actual Kisin map, its G_{K∞}-equivariance, bijectivity/dimension and height conclusions with the effective-filtration/ramification restrictions. Remove the obsolete use claiming that this node supplies the general theorem back to R06.2. Its general-CF dependency points forward from R06.3.
3. Synchronize P7’s reader/suggested placement for the two old R06.2-prefixed realization nodes now parented at R06.3. Preserve their IDs and the fixed-bound torsor gap. The Dat–Orlik–Rapoport book used by that gap was not cleared/read; use a permitted public proof or obtain maintainer clearance.
4. Develop the specialized CF lifting proof and verify early invariant/full-faithfulness statements at arbitrary perfect-residue scope. These are recorded mathematical proof obligations, not unresolved supplier choices. Do not replace them by applying the finite-Q_p Berger theorem to Q̆_p.
5. Normalize broader draft scheduling separately: the current incoming P7 already has VB3:general-BC → VB4 → R06.2 → VB3:general-BC. R07’s full draft has existing returns, including late residual-weight examples at R07.3 using R07.5. Its early FL admissibility/lattice proof closure uses only early R06.1/R06.2 and library inputs; late examples must not be prerequisites of the new CF supplier. No assertion of acyclicity for arbitrary unions of whole drafts is made.

No source files or scratch evidence need to be carried forward: public URLs, source hashes, exact locators, validation measurements and limitations are in the packet and fix report. Current upstream roadmap/library work remains imported without changes or duplicate planning.
