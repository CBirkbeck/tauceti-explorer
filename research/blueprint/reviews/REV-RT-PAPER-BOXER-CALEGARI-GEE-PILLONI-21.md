# REV-RT-PAPER-BOXER-CALEGARI-GEE-PILLONI-21

**Complete: all twenty-four findings confirmed.**

- Many of the fixes are amended.
- Parts of /17 and /22 are wrong, and are rejected within those findings.
- Finding 3 is right, but its stated reason is not.

**Job details:**

- **Job:** Refs #4315.
- **Verifier:** Claude Code, session `cc-48533a`, 30 September 2026.
- **Independence:** the extraction, its review and the red team (RT-PAPER-BOXER-CALEGARI-GEE-PILLONI-21, session `cc-f805bf`) were all done by other sessions.
- **Verdicts:** `research/blueprint/redteam/RT-PAPER-BOXER-CALEGARI-GEE-PILLONI-21.review.json`. `python3 scripts/check_redteam.py` reports it `ok`.

## Evidence and scope

**Sources.** Both texts match the extraction's recorded hashes.
- The published Publ. Math. IHÉS 134 (2021), 153–501, which is open access.
- arXiv v3, with its LaTeX source.

**Division of work.** Four verifiers worked in parallel:
- items against the recorded corrections, and the records themselves: findings 1, 2, 19, 20 and 23;
- the paper's mathematics: findings 3–7;
- routes and design jobs: findings 8–14;
- duplicates, missing items, statuses, statements and locators: findings 15–18, 21, 22 and 24.

**Checks.** Every quoted passage was read in both texts. Ordering claims were checked against `stageEdges`. Owners were checked against other papers' accepted routes. Unpromoted draft packets were treated as planning nothing.

## Items and records

**/1 (high). Confirmed.**
- The file has exactly eleven records that affect a stated result, all printed in both texts.
- Only item 46 (E36) and the notes of items 263 and 289 (E83) cite one.
- The verifier checked the records independently:
  - E139 by a point count on the conductor-249 curve at q = 97: a₁ = 10, a₂ = 82, and 63 is a non-square mod 97.
  - E155 by the exact discriminant of the sextic.
  - E6, E16, E144 and E156 by hand.

Amendments:
- **E136 is missing from the finding.** It is the eleventh record. Item 122 still states Lemma 9.1.10(3) as printed, and must be added. A counterexample is a non-CM elliptic curve twisted by an order-4 character mod 5.
- **E36 goes into two statements.** Carry p ∤ #Δ(K^p) into the statement of item 46, and into item 61 (Proposition 4.4.3).
- **Drop item 136.** E150 is a misprint in the proof, and item 136 has only the statement, which is correct.
- **Items 170 and 189.** Item 170 should take the route-3 brief's stronger corrected form of Lemma 2.5.1. Item 189 should lose its pointer to Lemma 9.2.7.

**/2. Confirmed.**
- Every listed item copies its printed error. For E52, the printed sign (−1)^{i_j} gives d∘d = −2f̄ in the two-divisor case.
- Item 109 contradicts E126: Proposition 7.4.17(1) gives generically reduced special fibres, so d′_η is an integer.
- Item 231's note repeats the E53 misprint.
- For E57, pick one of the record's two readings.

**/19 (low). Confirmed.**
- All thirteen mistakes are in both texts, and none has a record.
- Remark 7.5.23's last sentence is false. The order-128 Sylow 2-subgroup Q₈ ≀ ℤ/2 of Sp₄(F₃) is enormous (checked by direct computation), so §7.5.20's list is right.

Amendments:
- **One more record is needed.** Item 262 silently corrects the θ_{s,s′} composition order in the proof of Corollary 6.4.3.
- **Point every silently corrected item at the new records.**
- **Theorem 3.5.1(3) is an error affecting a stated result.** This matches PAPER-PILLONI-20/E40, which records the same claim.

**/20 (low). Confirmed.**
- All four incomplete records check out.
- For E113, drop both ψ = ε⁻¹ and "p unramified in F": the proof of Lemma 7.6.1 needs neither.

**/23 (low). Confirmed.**
- `collation.py`'s provenance function, run read-only, returns "preprint", because the Centre Mersenne URL does not match its publisher pattern.
- Adding sourceVersions makes it return "published". All three hashes match.
- The paper is not currently on the exposed list, because `papers.json` cites only arXiv.

## The paper's mathematics

**/3. Confirmed, with the reasoning corrected.**
- E137's correction of Proposition 9.1.12(2) dropped the disjointness "L′ is linearly disjoint over K′ from K′F^(avoid)", on which E140's argument relies.
- Item 174 still states the printed form, which E137 had already shown impossible.
- The finding's reason is wrong: Lemma 9.2.7(6) does not need that disjointness. Lemma 7.5.22 needs only that r̄_q has image SL₂(F_q) over K′(ζ_q). This is automatic once r̄_q maps onto GL₂(F_q) with det r̄_q = ε̄⁻¹. The paper uses condition (2) only for Lemma 9.2.7(2).
- The fix still stands: the stronger (2) is true, as checked through the auxiliary-place and Jordan's-lemma proof, including the fixed-determinant case.
- The brief should state E140's variant in full: image GL₂(F_q), and L′ ∩ K′F^(avoid) = K′(ζ_q).
- The records should say that (6) follows from full image together with the determinant.
- Condition (2) is on published p. 458.

**/4. Confirmed. New mistake.**
- The normalised map for U_{w,2} is the identity on the highest-weight line at w and an isomorphism at every other place. So the kernel pieces at places v ≠ w are not divisible by p.
- The one-line proof therefore works only when F = ℚ.
- The product ∏_{w|p} U_{w,2} is divisible by p, which is all that Lemma 4.6.25 uses.
- Record it as affecting a stated result.

**/5. Confirmed. New mistake.**
- Purity is a local condition, and nothing in Theorems 8.4.1 and 8.5.2 makes ρ unramified outside a finite set.
- The proof needs that, both to choose F′ and for Hypothesis 7.13.1(5).
- No application is affected.

**/6. Confirmed. New as a record.**
- Theorem 3.10.1(2) is stated only after localizing at a non-Eisenstein ideal, and its proof depends on that localization.
- Every use in §§7–8 is localized, so the main theorems stand.
- Restate item 287 in localized form as well as items 289–291.

**/7. Confirmed. New mistake.**
- The kernels of S_∞ → 𝒯[Δ_N] are neither open nor nested.
- The standard truncation, with explicit open ideals J_N, repairs the argument; the verifier checked it.
- Add P8 to item 150.
- Record it as an error affecting the proof ("gap" is defensible).

**Note for the brief.** When q = 3, Lemma 7.5.22 also needs the projective kernel fields to be linearly disjoint (E108), and the proof of Lemma 9.2.7 never checks this. E139's repair forces q > p², but the route-3 brief's repair does not. The brief should require q ≥ 5, which Lemma 9.2.6 allows. It should also match E139's repair, which makes the p-torsion of the local point at v | q agree with A[p] as Theorem 9.2.8 needs; the brief omits this.

## Routes and design jobs

**/8 (high). Confirmed, with the fix extended.**
- The queue holds two pending design jobs for AbelianSurfacesPotentialModularity, with the same four outputs and no ordering between them. BCGP 2025 has the same pair.
- `make_queue.py` drops a paper's design job only when the job id matches a hardcoded fixed job, never when the roadmap id matches. So DESIGN-BCGP18 never sees route 3's brief, and two lanes could write the same files.

Amendments:
- Changing the script is not enough, because it keeps old jobs it no longer generates. The four twin jobs (two designs and their reviews) must be set to `superseded` in `queue.json`, and issues #3472 and #3473 closed. These are maintainer edits.
- DESIGN-BCGP25 needs BCGP 2025 route 12's brief attached in the same way.
- The same duplicate-job bug also affects DESIGN-SKINNER, DESIGN-PAN and DESIGN-BETTS-STIX.

**/9. Confirmed.**
- Part II routes are merged by parent, contrary to PROTOCOL §16 ("DESIGN-<roadmap id>").
- Both GSp₄ directions come last in mixed groups.
- DESIGN-BCGP18 (order 3) would run before the Part IIs it imports.

Fix:
- Group jobs per roadmap id, and mark the old per-parent jobs `superseded`.
- Add ordering edges so that the higher Hida design follows the Hilbert–Siegel design, and DESIGN-BCGP18 follows the open-image Part II.

**/10. Confirmed. Half of it is already filed.**
- The GSp₄ Galois-representation duplicate is RT-AREA-langlands-1/19, whose edits await the maintainer's verdict records.
- The spinor Hecke polynomial half is new. The Calegari–Geraghty, Pilloni, BCGP 2021 and BCGP 2025 polynomials are one polynomial, up to reciprocal and renaming. The GSp₄ Part II should be its single owner.

**/11. Confirmed. The fix as written would give a false status.**
- BCGP 2025's Theorem 1.8.17 is strictly stronger than BCGP 2021's Corollary 7.9.6. It is GSp₄-valued, has no "vast and tidy", ᾱ ≠ β̄ or p > 2 hypotheses, and has a different proof.
- So the single owner must plan the stronger form, and item 322 cannot be marked planned at Corollary 7.9.6.

Also:
- Rewrite route 3's claim that "neither roadmap imports the other".
- Delete Calegari–Geraghty 2020's sentence that AbelianSurfacesPotentialModularity should import GSp4NonregularModularityLifting. Otherwise the two roadmaps import each other.

**/12. Confirmed.**
- The accepted Calegari–Geraghty open-image Part II already asks for the number-field version.
- The join must also state Ribet's large-image theorem and the density argument of Lemma 9.2.5.
- Route 26's verdict must be re-recorded, because its kind changes.

**/13. Confirmed.**
- Follow Pilloni 2020's RG2.5/D5 split.
- Add the edge RG2.5 → D5; no path exists either way.

**/14. Confirmed.**
- In `stageEdges`, R01.1 precedes both R06.2 and R02.x.
- G7 has no path to or from either, so it is a valid owner.
- Drop R01.1 from route 7, and point route 3's import at G7.
- Request Tate's H²(G_F, ℚ/ℤ) = 0 from R02.4; no stage plans it.

## Duplicates, statuses, statements, locators

**/15. Confirmed.**
- Items 144/264 and 259/265 duplicate the §6.5 material within one route each.
- The "T0 contradiction" is a stale sentence in item 264's note.
- Items 38 and 159 are not duplicates: they give two descriptions of groups with one owner (RG2.3), so merging them is optional.

**/16. Confirmed. Half of the fix is changed.**
- A construction item for X^*_K and its G₁-quotient is needed. C5 and route 1's brief cover it.
- The separate affineness item is not needed. Each p-rank stratum used in §4 is a single Ekedahl–Oort stratum, so affineness follows from items 182 and 221 and the quotient by Δ. Items 59 and 242 should cite those.
- The "not formal" remark is wrong.

**/17. Confirmed in part.**

Right:
- (a) Isobaric sums are not planned.
- (b) Kim's exterior square is not planned, and item 35's note contradicts item 11.
- (f) Item 185 should also cite ET.7a.

Wrong:
- The ST.5, R24.5 and ML.2 nodes are in unpromoted draft packets and plan nothing.
- Adding ST.5 to item 11 would create a second owner of GSp.
- R23.1 stays the only owner of the Moret-Bailly input.
- The proposed rewording of item 35 is false, because G is M0's similitude group.

Allen et al. 2023 item 18 must change together with (a).

**/18. Confirmed, with the destination changed.**
- Calegari–Geraghty 2020 (accepted) routes the GSp₄ Carayol lemma to IHG.1 (gluing) and ArithmeticGaloisRepresentations G7 (uniqueness).
- The new item goes there, not to GlobalGaloisDeformations G7, which would be a third owner.

**/21. Confirmed.**
- All five defects check out, including M̄ versus M in item 30, and the p ≥ 3 missing from item 73. That hypothesis is absent from the published text too.
- Item 53 should point to item 241.
- Item 101 lacks ν∘ρ̄ = ε̄⁻¹.

**/22 (low). Confirmed in part.**

Right:
- "Tidy" has two owners, and the fix must name ArithmeticGaloisRepresentations:G7, since GlobalGaloisDeformations also has a G7.
- Pure Weil–Deligne representations have two owners.
- The prerequisites fields are incomplete.

Wrong:
- Moving item 186 to ML.5; ML.4 fits its use.
- The route 17 complaint, which the route already states.

**/24 (low). Confirmed, but incomplete.** Items 115, 179 and 182 also lack published pages. About half of all locators in the file give no published page.

## For the maintainer

- Supersede the twin design and review jobs for BCGP 2021 and BCGP 2025 in `queue.json`.
- Change `make_queue.py` to drop jobs by roadmap id and to group Part IIs per roadmap id.
- Several fixes require edits in other accepted extractions: Allen et al. 2023, BCGP 2025, Calegari–Geraghty 2020 and Ciubotaru–Harris 2026.
- Citing the published version in `papers.json` is the maintainer's call.

## For the fix job

The high and medium findings (/1–/18 except the parts rejected above) become FIX-RT-PAPER-BOXER-CALEGARI-GEE-PILLONI-21. Apply them with the amendments above. The main points:
- /1: add E136 and item 122; drop item 136; carry E36 into items 46 and 61.
- /3: use the corrected reasoning.
- /11: the owner plans Theorem 1.8.17.
- /14: G7, with a request to R02.4.
- /17 and /22: only the confirmed parts.
- /18: IHG.1 and ArithmeticGaloisRepresentations G7.
