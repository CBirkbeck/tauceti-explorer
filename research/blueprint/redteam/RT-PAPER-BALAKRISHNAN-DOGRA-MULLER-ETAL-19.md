# RT-PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19: red team of the extraction of explicit Chabauty–Kim for X_s(13)

Red team: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #4324).

**Target.** `PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19` extracts J. S. Balakrishnan, N. Dogra, J. S. Müller, J. Tuitman and J. Vonk, *Explicit Chabauty–Kim for the split Cartan modular curve of level 13*, [Ann. of Math. 189 (2019), 885–944](https://doi.org/10.4007/annals.2019.189.3.6) (arXiv [1711.05846](https://arxiv.org/abs/1711.05846)).

**Who did what.**
- Claude Code `cc-442dc5` wrote the extraction (PR #2202).
- `REV-PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19` was written by Claude Code `cc-7b31c4` (PR #2328). It accepted all four routes, corrected the quotation in E3, added a note to E5 and added a declaration to item 81.
- I did none of this. The string `cc-f805bf` occurs in none of the four target files.

**Disclosure.** This session filed RT-PAPER-BETTS-STIX-25 (PR #4718). That red team compared Betts–Stix against this extraction and found no shared routes. I redid the comparison here and reached the same result. No finding below depends on that red team.

**Result: nine findings.** Six are medium and three low. The machine-readable file is [RT-PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19.result.json](RT-PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19.result.json).

- **Where the work is sound.**
  - Every numbered statement of the published paper has an item, and the locators are right.
  - The Fricke declarations cited for item 81 hold at Tau Ceti `f790474`.
  - E1–E8 are all real, and the review's corrections to E3 and E5 are right.
  - The algebra I re-derived agrees with the extraction: (45), the Teichmüller splitting, Lemma 5.7 and the genus formula.
- **Where it breaks.**
  - Nekovář's general p-adic heights now have two owners (finding 1).
  - Three "planned" statuses are too generous: the curves X_s(ℓ), X_ns(ℓ), X_0^+(ℓ²); Besser's transport; and the Gross–Zagier half of rank = g (findings 2–4).
  - Two inputs of the proof have no item: Tuitman's algorithm (finding 5) and the ℓ ≤ 7 half of Theorem 1.2 (finding 7).
  - Several source mistakes went unrecorded, one of them in a definition that item 68 copies (findings 6 and 8).

## Source

| Text | Where | SHA-256 |
| --- | --- | --- |
| Published, Ann. of Math. 189 (2019), 60 pp. | [Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), fetched 30 September 2026 | `e1aa5f96…3dff1f8` (matches the extraction) |
| arXiv v1 (15 November 2017; the only version) | [arXiv](https://arxiv.org/pdf/1711.05846v1) | `77c57b03…90c917` (matches) |

- **How I read it.** I read the whole published text, including Appendix A and the references, in a text extraction with page markers. I rendered p. 923 (the E3 display) and p. 931 (Z_1, Z_2) at 300 dpi. I read arXiv v1 wherever a finding turns on it.
- **Errata.** Crossref registers no update for the DOI, and the arXiv listing has v1 only.

## Findings

### 1. Nekovář's height pairing is planned twice (medium, duplicate)

**What the extraction did.** On 23 September it found no p-adic height anywhere in the atlas. It routed the general theory to NC.5:
- Nekovář's pairing on H^1_f(G_T,V) × H^1_f(G_T,V*(1)) (/24);
- the local decomposition h = Σ h_v (/26);
- the local heights away from p and at p (/27, /31).

**What changed.** A day later the accepted route 2 of PAPER-DISEGNI-LIU-24 created the Part II **SelmerComplexesAndPadicHeights**, and PAPER-DISEGNI-22 reuses it. Its brief plans:
- Nekovář's pairing on H^1_f under (V1)–(V3);
- its decomposition into local terms;
- Nekovář's local index.

Its first test is to recover, for a curve and degree-0 divisors, "Nekovář's height pairing on Selmer groups of the Jacobian". That is this case.

**Fix.**
- Make /24 and /26, and the general definitions /27 and /31, planned at the Part II, and send it this paper as a test source.
- Keep the application in NC.5: A_Z(b,x), twisting, (θ, Υ), formula (17), Lemma 3.7 and Corollary 3.8.

### 2. X_s(ℓ), X_ns(ℓ) and X_0^+(ℓ²) are not planned where item 1 says (medium, error)

**The claim.** Item 1 cites Tau Ceti ModularCurves layers 9 and 10, "X_s(ℓ) and X_ns(ℓ) are instances".

**Why it fails.**
- Layer 10's class is the prime-level diamond quotients Y_1(N)/H, "and not arbitrary finite quotients of Layer 9, for which none of the assertions below is made".
- Layer 9 plans only the affine quotient problems. Its regularity theorems cover semi-Borel and product-Cartan subgroups, not Cartan normalisers.
- So none of the following is planned anywhere:
  - the projective curves X(ℓ)/C_s(ℓ)^+ and X(ℓ)/C_ns(ℓ)^+ with their cusps;
  - X_0(169) and its quotient by w_169, which are composite level;
  - the moduli meaning of a rational point.
- Theorem 1.1 counts a cusp among the seven points, so it needs all of these.

**A second problem.** Item 71, the isomorphism X_0^+(ℓ²) ≃ X_s(ℓ), is a statement about generic fibres. It was routed to R13.5, the bad-fibre layer.

**Fix.** Make item 1 missing and route it, with item 71, to ModularCurvesPartII R13.4a, the layer that builds coarse compactified curves beyond layer 10's class.

### 3. Besser's Frobenius-equivariant transport is not planned (medium, error)

**The claim.** Item 58 is "planned at ColemanIntegration L1", and the report says L1 plans "Besser's Tannakian iterated integrals".

**Why it fails.**
- L1 plans Coleman functions and iterated Coleman integrals.
- It avoids the Tannakian formulation on purpose: "so that no general Tannakian theorem is an unowned prerequisite".
- Its packet has no node on transport, path torsors or unipotent isocrystals.

**What goes unplanned.** Besser's theorem (p. 921): with Coleman integrals, (41) is the unique unipotent Frobenius-equivariant isomorphism A_n^dR(b_0,x_0) → A_n^dR(b,x). §5.3.2, Lemma 5.7 and §6.6 rest on it.

**Fix.**
- Split item 58: the residue-disk formula stays at L1.
- Besser's theorem becomes a missing item, routed with item 57 to NC.2.
- Correct the report's sentence about L1.

### 4. Item 79's Gross–Zagier half contradicts PAPER-GROSS-ZAGIER-86 (medium, error)

**The claim.** Item 79 says analytic rank one gives rank A_f(Q) = dim A_f, planned at GZ.8 and HE.7.

**Why it fails.**
- The accepted Gross–Zagier extraction records the lower bound, rank ≥ m for an m-dimensional A_f, as its item 304. Its status there is **missing**: "no stage states the rank ≥ m … conclusion for A_f over ℚ".
- That extraction routes the item to GZ.8. GZ.8 itself specialises only to elliptic quotients.
- HE.7 does plan the Kolyvagin–Logachev upper bound.

**Fix.** Split item 79: the lower bound becomes missing and is routed to GZ.8, citing GZ86/304; the upper bound stays planned at HE.7.

### 5. Tuitman's algorithm has no item (medium, missing)

**Where the paper uses it.** The proof of Theorem 1.1 uses [Tui16, Tui17] for three things:
- F and f with φ*ω = Fω + df, and the solution of (45) (p. 924);
- the matrices Fr_q, which give A_q through (50) and hence Z_1, Z_2 and the K-action (p. 930);
- the Frobenius lifts on ]U_1[ and ]U_2[ (pp. 931, 933).

**What the extraction has.** Items 60, 84 and 87 take the outputs as given. No stage plans the algorithm: RD.7 and CN.3 do not cover it.

**Fix.** Add an item stating the algorithm with its hypotheses and precision bounds, and route it to ED.6, importing RD.4/RD.7. Cite [BT17] in item 92 and [AS05] in item 82 as items or inside those statements.

### 6. Definition A.2 omits uniqueness (medium, error)

**What the paper says.** Definition A.2 (p. 935) asks only that a morphism (E,e) → (V,v) *exist*. It then says universal objects are "unique up to unique isomorphism". Item 68 copies both statements.

**Counterexample.** (A_n ⊕ 1, (1,0)) satisfies the printed definition, since the projection to (A_n,1) composed with the universal map reaches every (V,v). It is not isomorphic to (A_n, 1).

**Why it matters.**
- Lemma 5.2's proof needs uniqueness: "a morphism of n-unipotent universal objects is determined by where it sends 1".
- So does the proof of Lemma A.4.
- Theorem 4.2 states uniqueness, so the intended definition is clear. arXiv v1 has the same wording.

**Fix.** Record this as E9 (misprint, affects nothing) and restate item 68 with "a unique morphism".

### 7. The ℓ ∈ {2,3,5,7} half of Theorem 1.2 has no item (low, missing)

**The gap.** Theorem 1.2 asserts equality with {2, 3, 5, 7}. The paper and item 6 justify only the exclusion of ℓ ≥ 11.

**The missing argument.** For ℓ ≤ 7, X_s(ℓ) ≅ X_0^+(ℓ²) has genus 0 and a rational cusp. So it is P¹ over Q, and it has non-CM non-cuspidal rational points.

**Fix.** Add this as an item routed with item 6, and note that the paper leaves it to the reader.

### 8. Further source mistakes (low, other)

- **Definition A.1.** It reads "every object V admits a nonzero morphism 1 → V", which fails for V = 0; it should say every nonzero object. Item 67 copies it.
- **The [Nek93] DOI.** It is printed as 10.1007/s10107-005-0696-y, which Crossref resolves to "Solving discrete zero point problems", *Mathematical Programming* (2006). The extraction's prerequisites list uses the right DOI, 10.1007/978-1-4757-4271-8_8, without recording the error. The same list prints "Complex Abelian Barieties".
- **Corollary 6.7.** Its proof derives "good reduction outside 13" from Theorem 6.6, which concerns only ℓ = 13. The claim holds by the first model of §6.3, which has good reduction away from 13. At 2 the quotient argument would need its own proof.

**Fix.** Record these as E10–E12 and correct items 67 and 76.

### 9. Bookkeeping (low, other)

- The file has no `sourceVersions`, although E5 quotes a stated result; `check_errata.py` reports this.
- E1–E8 carry no `review` blocks, although the review confirmed all eight.
- Gap G-numerics names ED.0 where the owner of certified L-value approximations is CN.4.

## What I checked

The `checked` list in the result file gives the detail. In short:

- **Independence and disclosure.**
- **Hashes and versions** of both texts.
- **Coverage** of every numbered statement.
- **Re-derivations:** the three blocks of (45), the splitting on p. 923, Lemma 5.7, Theorem 6.6's genus count and the antisymmetry of Z_1 and Z_2.
- **E1–E8** at their locators, and the review's three in-place changes.
- **The four Fricke declarations** at the pin, and a keyword sweep of `declarations.tsv`.
- **Every cited layer** at the atlas, and the NC, ED and ColemanIntegration packets.
- **Other extractions and Part IIs** that route the same material: Disegni–Liu, Disegni, Gross–Zagier, Kolyvagin, Betts–Stix, Schmidt–Stix, Bresciani and Bennett–Siksek.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on both files: 2 files, 0 problems.
