# RT-PAPER-SCHIFFMANN-16: fixes

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #4993, job FIX-RT-PAPER-SCHIFFMANN-16).

**Scope.**
- **Findings:** `RT-PAPER-SCHIFFMANN-16.result.json`.
- **Verdicts:** `RT-PAPER-SCHIFFMANN-16.review.json`, by Codex session codex-a71f92. All thirteen findings are
  confirmed. The issue lists the three high and five medium ones (/1–/8), and this job applies them. The five low
  ones (/9–/13) are not part of it.
- **Corrections:** where the verifier corrected or qualified a fix, I applied its version. Each section says how.
- **FIX-RT-AREA-etale.** Its report (`RT-AREA-etale.fixes.md`, merged in #4611) wrote exact edits to this
  extraction in sections 1.3, 1.5, 1.6 and 1.7, which that job could not apply. This job's findings build on them:
  - /1 numbers its new source issue E8 "after the E5–E7 proposed by FIX-RT-AREA-etale", and asks for the
    `sourceVersions` of 1.7;
  - /3 sends item 36 to the Part II of 1.3.

  So I applied those four sections too, verbatim except where noted.

**Files changed.**
- `papers/PAPER-SCHIFFMANN-16.result.json`.
- `papers/PAPER-SCHIFFMANN-16.md`, which gets a closing section.

**Result.** Before and after:

| | Before | After |
|---|---|---|
| Items | 59 (1 library, 3 planned, 55 missing) | 67 (1 library, 2 planned, 64 missing) |
| Routes | 4 | 6 |
| Prerequisites | 13 | 14 |
| Source issues | 4 | 12 |
| `sourceVersions` | none | 3 entries |

**Independence.** I did none of:
- the extraction (cc-7b31c4);
- its review (cc-d67081);
- the red team (cc-f805bf);
- the verification (codex-a71f92);
- FIX-RT-AREA-etale (cc-39fac3).

**What I read, on 30 September 2026.** Every quotation below was checked against one of these.
- **arXiv v2 LaTeX source** (`Indecomposables.tex`; archive sha256 `a84104fa…0467`).
- **arXiv v2 PDF** (sha256 `7e5cbf6e…9bb2`, 38 pages).
- **Annals PDF** (sha256 `8e486963…c7a5`, 66 pages, printed page = PDF page + 296).

The three hashes match those recorded by the review and by FIX-RT-AREA-etale. I also read:
- Mellit's arXiv:1707.04214v1 LaTeX source (`poincare.tex`), for Theorem 1.1 and Corollary 1.2;
- Crossref metadata for Mellit's DOI (Invent. Math. 221 (2020), 301–327) and for the Annals DOI, which links no
  erratum;
- the four Tau Ceti declarations at f790474 and the two Mathlib declarations at 082e2d3;
- ET.2b, GS.0, FA.1, FA.5 and RG2.3 in the atlas extracts;
- the QM.0 packet;
- PAPER-YU-23, PAPER-GROECHENIG-WYSS-ZIEGLER-20, PAPER-BROWNING-SAWIN-20, PAPER-BERGSTROM-FABER-PAYNE-24 and
  PAPER-TREUMANN-VENKATESH-16.

## /1 (high, error): Corollary 1.4 (v2 1.9) has both exponents wrong

**The check.** Both versions print Ā = q^{2(1+(g−1)r²}A(z^{−1}) in (i) and degree 1+(g−1)r² in (ii): v2 p. 5 in
the source, and published p. 301. The published proof (§6.11, pp. 351–352) gives the corrected values.

Write D = 1+(g−1)r². Then:
- n⁺_i = ½ dim Higgs^st = D;
- dim Z_i = D − n⁻_i;
- |Higgs^st| = q^D Σ_i|Z_i|;
- Poincaré duality on each Z_i gives |Λ^st| = q^D A(σ^{−1}).

H^{2D} of the D-dimensional Λ^st counts its components. I also checked the red team's r = 1 and (1, 2, 1)
computations by hand.
- In rank one every Higgs line bundle is stable, so Higgs^st_{1,d} = Pic^d(X) × H⁰(Ω_X).
- For (1, 2, 1) on an elliptic curve, a stable Higgs pair has a stable underlying bundle. If the bundle is L_1 ⊕ L_2
  with deg L_1 > deg L_2, then Hom(L_1, L_2) = 0, so L_1 is θ-invariant and destabilising. The corresponding
  extensions split, since Ext¹(L_2, L_1) = 0.

**Changes.**
- **Item 12.**
  - (i) now reads q^{1+(g−1)r²}A(z^{−1}), and (ii) reads H^{2(1+(g−1)r²)}.
  - The two acceptance tests are in the note.
  - The published locator is added.
- **Hypotheses, as the verifier asked.**
  - Coprimality is kept.
  - The cohomology is named in both settings: geometric ℓ-adic over F̄_q, singular over C.
  - The characteristic is stated: the proof given needs char > C(r,d), through Theorem 3. The printed corollary
    states no bound, and the paper cites Mozgovoy–Schiffmann for Theorem 3 in all characteristics (p. 300).
- **Item 12's note** also records the properness of the Hitchin map that the proof uses. See /6.
- **E4.**
  - The sentence on the unmatched parenthesis is deleted, with its published-version clause, so E4 is the two index
    slips.
  - E4's embedded review said "Confirmed in all three parts". I did not rewrite it. I appended a dated bracket
    saying that the third part is withdrawn and why, so that the review no longer endorses q^{2D}, which the
    verifier required.
- **E8.** It is new: an error that affects a stated result, known "new", with the issue's locator. The printed
  field quotes the v2 LaTeX and the published text.
- **Numbering.** The verifier asked for fresh ids coordinated with the étale fix, so E8 follows E5–E7.
- **`sourceVersions`.** It has the two entries of FIX-RT-AREA-etale 1.7, plus a third for the v2 LaTeX archive that
  the extraction actually read (22 September 2026, the sha256 recorded in `source.read`).

## /2 (high, error): the Poincaré polynomial needs (−1)^n

**The check.**
- The v2 source's Corollaries 1.6 and 1.7 (p. 4) have Σ_n dim H^n_c t^n without a sign. Published Corollary 1.3
  (p. 300) has Σ_n (−1)^n dim H^n_c t^n in both parts.
- The rank-one check: t^{2g}(1+t)^{2g} against t^{2g}(1−t)^{2g}.
- The sentence before v2 Corollary 1.8 says "connected and of dimension 1+(g−1)r²". The published proof of
  Corollary 1.5 (p. 352) says 2(1+(g−1)r²).

**Changes.**
- **Item 11.**
  - Both sums are signed.
  - The degree statement now names the dimension 2(1+(g−1)r²) it rests on.
  - p > C(r,d) is kept, as the verifier asked.
  - The locator gains the published Corollaries 1.3 and 1.5, pp. 300–302, and the proofs, pp. 349–352.
  - The note gives the crosswalk: v2 1.6 = published 1.3(i) with the first sentence of 1.5; v2 1.7 = 1.3(ii); v2
    1.8 = the second sentence of 1.5.
- **E9**, a misprint in the missing sign. The known field is the published Corollary 1.3. I set `affects` to "a
  stated result", because the printed v2 identity is false for every g ≥ 1. Its impact field says that the
  eigenvalue description and the positivity are untouched.
- **E10**, a misprint in the dimension. The known field is the proof of the published Corollary 1.5. I set
  `affects` to "the proof": the premise of the one-line deduction is misstated, and the conclusion is right. As the
  verifier warned, this is not a reason to halve any cohomological degree.

## /3 (high, duplicate): one owner for each statement shared with PAPER-YU-23

The verifier confirmed overlapping contracts, not literal equality, and left the choice of supplier to this job. I
took the red team's proposal.

- **Route 1 owns** the counting polynomial and Theorems 1–3 with their corollaries (items 2, 3, 7, 10, 11 and 12),
  Mellit's theorem (item 8), Krull–Schmidt for Coh(X) (item 15) and the stable Higgs moduli (item 9, see /6). The
  brief says so, and says that Yu's route 12 imports them by node id.
- **The verifier's qualifications, in route 1's brief.**
  - Yu 046 needs Mellit's all-degree theorem, not only this paper.
  - Yu 037 needs Theorem 3 in its stated characteristic range; the paper cites Mozgovoy–Schiffmann for all
    characteristics.
- **Route 1's reason** now says that PAPER-YU-23 route 12 covers the same ground, and lists the seven Yu items.
- **Item 5 (plethystic Exp and Log)** leaves route 1 for a new source route 5 to QM.0. It joins Yu's route 7 and
  Bergström–Faber–Payne's route 9.
  - It stays missing: I checked the QM.0 packet, and it has no plethystic node. The verifier noted that QM.0's
    received route does not show that one exists.
  - "The plethystic calculus" is deleted from the brief's list of what route 1 owns, and the brief imports it from
    QM.0.
- **Item 36 (density)** goes to the LefschetzPencilsAndVanishingCycles Part II, as FIX-RT-AREA-etale 1.3 wrote it.
  Route 3 is replaced by that section's object verbatim: the same roadmap id, title and area as Browning–Sawin route
  6. Item 36's locator and note follow 1.5, and route 1's brief follows 1.6.
  - The verifier said to coordinate the density with that pending Part II, not DWP.0 alone, and to use no node ids
    before contracts exist. None are used.
- **Item 1 and route 1's brief** identify R_g = Q[T_g]^{W_g} with the rationalised full character ring Q ⊗
  R(GSp_{2g}), which ClassicalGroupsPartII plans (Yu route 13, item 099). As the verifier required, they also say
  that Yu's "R_g" is the smaller integral ring generated by the constituents of tensor powers of the standard
  representation. T_g is the maximal torus of GSp_{2g} (dimension g + 1) and W_g = S_g ⋉ (S_2)^g its Weyl group.
- **The review's route 1 note** ("no other extraction proposes it") is in `PAPER-SCHIFFMANN-16.review.json`, which
  this job may not edit. It is left for the maintainer.

## /4 (medium, error): Mellit's theorem

**The check.** I read Theorem 1.1 of Mellit's arXiv v1 source. For g ≥ 1:
- H_g = −(1−q)(1−z) Log Ω_g, and each H_{g,r} is a Laurent polynomial in q, z and α_1, …, α_g;
- for all d, A_{g,r,d}(q, α) = H_{g,r}(q, 1, α).

Crossref confirms the published version, Invent. Math. 221 (2020), 301–327, doi:10.1007/s00222-020-00950-1.

**Changes.**
- **Item 8.**
  - The statement and locator are kept, with the published Conjectures 1.7–1.8 (p. 305) added.
  - The name becomes "Conjecture 1 (now Mellit's theorem): independence of the degree".
  - The note's last sentence is replaced as the finding asked, with the verifier's qualifications:
    - Mellit's bound g ≥ 1;
    - genus zero separately: every bundle on P¹ splits, so A_{0,1,d} = 1 and A_{0,r,d} = 0 for r ≥ 2;
    - that Conjecture 1.4 follows by the paper's own reduction;
    - that Mellit's Corollary 1.2, on E-polynomials in coprime degrees, is a different statement.
- **The GWZ-20 route.** The finding's "for coprime d it also follows from GWZ-20 item 70" is kept with that item's
  hypotheses. They are: characteristic prime to n, d and e, and a primitive n^{2g}-th root of unity in k. It is
  recorded as a weaker route, not as a proof of the identity in K_g.
- **Item 3's note.** Mellit's Laurent polynomial is a regular W_g-invariant function on T_g, so A_{g,r,d} ∈
  Q[T_g]^{W_g}. Mellit's variables are α_1, …, α_g with α_{i+g} = qα_i^{−1}, one coordinate from each pair of T_g,
  so no localisation is needed. As the verifier said, this does not settle positivity or the refined counts.
- **Route 1's brief (8)** takes Mellit's theorem out of the open conjectures. It is planned in route 1 with Mellit's
  paper as source, since no other roadmap has it. The brief's closing sentence now leaves only the Section 8
  conjectures open.
- **Prerequisites** gain Mellit's paper.

## /5 (medium, error): Theorem 7.1 and Corollary 8.1 are stated in K_g

**The check.**
- **v2 Corollary 8.1** (p. 33) has Q[T_g]^{W_g}. The published version (p. 353) has K_g, introduced by "The proof
  of Theorem 1.1 yields the following".
- **Theorem 7.1** has Q[T_g]^{W_g} in both versions: v2 p. 32, published pp. 352–353. §7.2 says only that "the
  proof … is completely parallel to that of Theorem 1.1".

**Changes.** The verifier gave the two points different diagnoses, and I followed it.
- **Item 55** uses K_g, with the published locator. **E11** is a misprint corrected in print.
- **Item 54** states the conclusion in K_g.
  - Following the verifier, the printed Q[T_g]^{W_g} is kept in the statement and the note as an open regularity
    obligation. It is not discarded.
  - The note says that Mellit discharges it for N = 0 (g ≥ 1), and that nothing in the paper, and not Mellit,
    discharges it for N ≥ 1.
  - The old "For g = 0 this settles a conjecture of Schiffmann" moves to the note. It rests on the printed
    assertion, and [Sch04] was not read.
- **E12** is a gap that affects a stated result. Its known field is "new; for N = 0 and g ≥ 1 settled by Mellit".
  Its reason says that it is a gap in the justification, not a disproof.

## /6 (medium, error): the Higgs moduli leave ET.2b

**The check.** ET.2b's text is "Higgs fields twisted by a chosen sufficiently positive divisor". It has no
stability condition and no coarse moduli space. GS.0 constructs Bun_G.

The published §6.2 (p. 337) says: "The stack Higgs^st_{r,d}(X) is a G_m-gerbe over a smooth connected scheme over
k, which we denote by Higgs^st_{r,d}". The proof of Corollary 1.4 (p. 351) uses "Since µ is proper".

**Changes.**
- **Item 9** is now missing, with `planned` emptied.
  - The statement no longer calls the stack a scheme, and it adds the properness of the Hitchin map on
    Higgs^st_{r,d}. The locator gains pp. 336–337 and 351.
  - The note keeps GS.0 and ET.2b as the suppliers of Bun_{GL_r}, the Higgs stack and the Hitchin map, and lists
    what they do not plan.
  - Following the verifier, the note says that ET.2b does not state whether Ω_X qualifies as its twist. It does not
    claim an exclusion bound.
- **The owner is route 1**, whose brief (7) already listed these statements. The brief now names the gerbe and the
  properness. It records that Yu 036 imports them, and that GWZ-20/62, for SL_n, is a related target, not the same
  one.
- **Route 4.** Item 9 leaves it. The sentence of its reason about Higgs definitions is replaced by why they left.
- **Route 1's import of ET.2b** is narrowed to the Higgs stack for a twisting divisor, the Hitchin base and map and
  the Picard stack.
- **The review's route 4 reason** says the Higgs moduli "are imported rather than re-planned by route 1". It is in
  the review file and is left for the maintainer.

## /7 (medium, library-claim): Krull–Schmidt and the radical

**The check.** I opened the four Tau Ceti declarations at f790474, whose lines match the verifier's.
- `exists_equiv_linearEquiv_of_directSum_of_isLocalRing_end` (DirectSum.lean:154) has no finiteness hypothesis on
  M.
- `isLocalRing_end_of_isIndecomposable` (Indecomposable.lean:263) needs `IsFiniteLength A M`.
- The other two are at Existence.lean:181 and Uniqueness.lean:187.

In Mathlib at 082e2d3:
- `IsArtinianRing.isNilpotent_jacobson_bot` is at Artinian/Ring.lean:54;
- `IsArtinianRing.isSemisimpleRing_iff_jacobson` is at Artinian/Module.lean:650;
- the `IsSemiprimaryRing` instance follows it.

**Changes.**
- **Item 15.**
  - It cites the four Tau Ceti declarations and stays missing, as the verifier required. Their types are about
    modules.
  - The note spells out the transfer:
    - (a) End(M) of an indecomposable sheaf is a finite-dimensional algebra without nontrivial idempotents, since
      idempotents split in Coh(X). Fitting's lemma applied to End(M) as a module over itself makes it local. This is
      the type-correct use of the cited lemma, not an application to the sheaf.
    - (b) Azumaya's matching transfers through Hom(M, −) to projective End(M)-modules, or through a categorical
      exchange argument.
  - The published locator (Lemma 2.3, p. 309) is added.
- **Item 16** cites the two Mathlib declarations and stays missing for the sheaf-specific computation. The published
  locator is Lemma 2.4, p. 309.
- **Route 1's brief.**
  - "Krull–Schmidt for finite-length modules … from the Tau Ceti roadmap on quiver representations" is replaced by
    the declarations, with only the transfer planned.
  - The Mathlib inputs are named.
  - "Nothing else in this roadmap is in the libraries" becomes "Beyond these, …".
- **Atiyah's prerequisite** gets the same correction.
- **PAPER-YU-23/027.** The same applies to it; this is left for the maintainer.

## /8 (medium, missing): the derivation of Theorem 1.6 and three facts

**The check.** I read v2 §§5.5–5.8 in the LaTeX source and the published §§5.5–5.8. v2's equations (5.10)–(5.18)
are published (5.14)–(5.22). The v2 pages are 19–21 in the 38-page PDF, not the red team's 23–29.

I also read:
- published Lemma 2.6 (pp. 310–311), whose v2 counterpart (p. 8) only asserts the counts;
- published Lemma 6.2 (pp. 340–341) and the |Y_1(k)| count (p. 349), which are v2 Lemma 6.4 (p. 27) and p. 29.

**New items, in route 1, each with both locators.**
- `residue-formula-arbitrary-ranks`: (5.14)–(5.15).
- `jordan-type-sum`: (5.16)–(5.18), with the bijection between generic Jordan types and partitions and the
  stabilisation of the truncated sums.
- `generating-identity`: (5.19)–(5.21), with the torsion count. The count is stated for d > 0 only, as the verifier
  required.
- `periodicity-and-residue-extraction`: (5.22).
- `degree-mod-r`.
  - Following the verifier, it asks for a line bundle of degree one over the base and assumes no rational point.
    Such a bundle exists by F. K. Schmidt's theorem.
  - FA.1's text does not state that theorem, though its acceptance test warns against a silent degree-one base
    point, so the note tells the design job to request it from FA.1.
- `galois-descent-of-indecomposables`: Lemma 2.6 with (2.4)–(2.5).
  - As the verifier required, it states both inputs the printed proof uses: H¹ trivial (Steinberg) and H² neutral
    (Springer). It says that H² gives effectivity and H¹ uniqueness, and that H¹ alone does not give existence.
  - The H² input has no atlas owner, so it is planned here.
- `coprime-indecomposables-absolute`. The paper asserts it without proof. The item gives the one-line orbit
  argument (l divides gcd(r,d)) and labels it as such.

**A new item and route for Lang's theorem.** `lang-steinberg` is routed to ReductiveGroupsPartII RG2.3 by a new
source route 6. It is the same request as PAPER-LIPNOWSKI-TSIMERMAN-18/lang-theorem and
PAPER-TREUMANN-VENKATESH-16/lang-steinberg. RG2.3's text does not state it (I checked), so it stays missing.

**Item 7** states the rank-two formula, copied from the v2 source and identical in print (p. 305). The acceptance
tests are in the note. I checked both symbolically (sympy):
- at g = 0 the formula is 0, matching Grothendieck's splitting;
- at g = 1 with α_2 = q/α_1, it is exactly (1 − α_1)(1 − α_1^{−1}q) = |E(F_q)|.

As the verifier said, these corroborate the formula and do not prove it.

**Other changes.**
- **Item 19's note** points to the descent item.
- **Route 1's brief** (2) and (6) list the new steps. Its equation numbers are the published ones.

## Not applied, and why

- **The five low findings (/9–/13).** They are outside the issue. Two things near my edits are left for them:
  - /13's `q^{dim}/2` typo in item 10's note;
  - /12's R09.2 and GS.0 statuses of items 14 and 43.
- **FIX-RT-AREA-etale 1.4** (the review verdict of route 3). The review file is not a deliverable.

## For the maintainer

- **Verdicts** to record in `PAPER-SCHIFFMANN-16.review.json`:
  - **Route 3** changed kind, from a DWP.0 source to the LPV Part II. FIX-RT-AREA-etale 1.4 gives the replacement
    reason.
  - **Route 5**, the QM.0 source, is new.
  - **Route 6**, the RG2.3 source, is new.
  - **Route 1's reason** should drop "no other extraction proposes it".
  - **Route 4's reason** should drop "the moduli of Higgs bundles and the global nilpotent cone belong there and are
    imported rather than re-planned by route 1".
- **DWP.8:equidistribution.** Route 3's reason, its brief and item 36's note name this substage. FIX-RT-AREA-etale
  1.1 proposes it, and it is not yet in the atlas.
- **PAPER-YU-23**, for one owner per statement. I cannot edit this file. `check_paper` allows `planned` only for
  atlas stages, so until CountingBundlesAndHallAlgebrasOfCurves exists the way to import is to join its route:
  - **The joining route.** Move items 027, 036, 037, 046, 131 and 178 out of route 12 into a `new` route with this
    paper's route 1 id, title and area, and have route 12's brief import them.
    - 046 carries Mellit's theorem, which this paper's route 1 now plans.
    - 037's characteristic range should be kept.
  - **Item 100 (density)** should join the LPV Part II (route 3 here).
  - **Item 044** stays at QM.0.
  - **Item 099's** GSp_{2g} character ring is the ring whose rationalisation is R_g here. Its "R_g" is a smaller
    ring, and the names should be kept apart.
  - **Item 027's note** should cite the Tau Ceti Krull–Schmidt declarations (/7).

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/*.result.json`: every extraction ok.
- `source_issues.check_issues` on the 12 entries: no errors.
- `check_errata.versions_checked`: no errors. `sourceVersions` is present for the findings that affect a stated
  result (E8, E9, E11, E12).
- `research/blueprint/intake.py check-files` on the three deliverables: no problems.
- Every missing item is routed exactly once. Route 3 matches Browning–Sawin route 6's id, title and area.
- The JSON keeps the file's own formatting (indent 1, UTF-8, trailing newline). The edits were made by a script that
  asserts each replaced string occurs exactly once.
