# PAPER-CLOZEL-THORNE-17: extraction and routing

Issue #1336. Claude Code, session cc-442dc5. The extraction is complete. Implementation and proof closure are not claimed.

Laurent Clozel and Jack A. Thorne, *Level-raising and symmetric power functoriality, III*, Duke Math. J. 166 (2017), 325–402 (doi 10.1215/00127094-3714971). The paper is not on arXiv.

The result has **56 items: 9 planned and 47 missing**. No item is in Mathlib or Tau Ceti. The routes are:

- a **Part II of ModularityAndLanglandsExtensions** (33 items), for the level-raising method;
- a **source route into ModularityAndLanglandsExtensions ML.0/ML.2/ML.3** (8 items), for the symmetric-power endpoints and the §7 reductions;
- a **source route into SmoothRepresentationsOfLocalGroups SR.1–SR.3** (4 items), for general local representation theory;
- a **source route into LocalGaloisDeformationRings L7** (2 items), for the partition deformation rings R^m_v.

Five misprints are recorded under `sourceIssues`. No stated result is affected.

## What the paper proves

**The main theorems:**

- **Theorem 6.1 (Theorem 1.1).** Let F be totally real and π a non-CM RAESDC representation of GL_2(A_F).
  - If F ∩ Q(ζ_5) = Q, then Sym^6 π exists as a cuspidal representation of GL_7(A_F).
  - If F ∩ Q(ζ_7) = Q, then Sym^8 π exists on GL_9(A_F).
- **Corollary 7.2.** Together with the earlier papers of the series (Sym^5 and Sym^7) and a reduction for forms of mixed parity (§7), Sym^r π exists in the following cases, and L(Sym^r π, s) is entire:
  - for r ≤ 4 over any totally real F;
  - for r = 5, 6 when F ∩ Q(ζ_5) = Q;
  - for r = 7 when F ∩ Q(ζ_35) = Q;
  - for r = 8 when F ∩ Q(ζ_7) = Q.

**The method,** for l = 5 or 7:

1. **The congruence.** For a two-dimensional r̄ over F̄_l, (Sym^{l+1} r̄)^ss ≅ (φr̄ ⊗ r̄) ⊕ χ²Sym^{l−3} r̄. After base change to a CM field E, the residual representation is therefore endoscopic of type (4, l − 2).
   - Thorne's automorphy lifting theorem for residually reducible representations (JAMS 2015) applies once one has an automorphic lift that is Steinberg at some place.
   - Producing that lift ("level-raising") is the bulk of the paper.
2. **Local theory at a ramified place (§2).** For E/F ramified, the Iwahori–Hecke algebra of U_{2k+1} is isomorphic to that of Sp_{2k} (Proposition 2.2).
   - Kazhdan–Lusztig's classification then produces Iwahori-spherical modules X, Y, Z attached to St_{n−4} ⊞ St_3 ⊞ St_1, with explicit Jacquet exponents (Theorem 2.5).
   - With Reeder's explicit matrices, when q is a primitive root mod l they have integral structures whose reductions share no constituent (Proposition 2.6).
3. **L-packets and transfer (§3).** These modules are the semistable members of the Mœglin–Mok L-packet, with signs ε(X) = −1, ε(Y) = ε(Z) = 1 (Theorems 2.3, 3.3), proved by an explicit transfer-factor computation (Lemma 3.6) and a Mœglin Jacquet-module lemma (Proposition 3.7).
   - Automorphic representations of a definite unitary group with endoscopic or cuspidal base change are then counted: 4^{s+1}/2, resp. 4^{s+1} (Theorems 3.8, 3.10).
4. **Automorphic level-raising (§4).** This uses algebraic modular forms, a perfect pairing that vanishes on the parahoric-level subspace when q_{v_0} ≡ −1 mod l (Proposition 4.3), and a rank count (Lemma 4.4, Proposition 2.9).
   - It shows that some form has more ramification at a place above v_0 than the initial endoscopic one (Theorem 4.2).
   - The count works only for l ≤ 7 (Remark 4.5).
5. **Galois-theoretic level-raising (§5).** Deformation theory of the reducible residual representation, with a new local condition R^m_v bounding monodromy by a partition (Lemmas 5.2–5.6), upgrades this to a lift that is Steinberg at some place (Theorem 5.1).
   - Combining this with Thorne 2015 gives a new automorphy lifting theorem (Theorem 5.7).
6. **Assembly and the mixed-parity case (§§6–7).**
   - Theorem 6.2 assembles the argument, using Ramakrishnan's GL_2 × GL_2 → GL_4, Gelbart–Jacquet and Kim.
   - §7 reduces the mixed-parity case to the constant-parity one through CM base change and BLGGT's potential diagonalisability.

## Sources inspected

- **The accepted manuscript**, dated 10 December 2015, 53 pages, from two copies with identical extracted text:
  - the second author's homepage, [lrspiii.pdf](https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf), SHA-256 `a3fa46fc…3659`. Its server omits the Let's Encrypt intermediate certificate, which was fetched from the certificate's AIA URL so that TLS verification stayed on;
  - the Cambridge repository [Apollo](https://www.repository.cam.ac.uk/items/478eb67b-3840-4089-a5f7-360592d61a4b), "Accepted version", SHA-256 `fb88e83c…4742`.

  It was read in full. The introduction thanks "all the referees", so the manuscript is post-refereeing.
- **The published article** ([doi 10.1215/00127094-3714971](https://doi.org/10.1215/00127094-3714971), 78 pages) could not be accessed: Project Euclid refused automated access.
  - **Locators give accepted-manuscript page numbers.**
  - **The source issues were not checked against the published text.**
- **Metadata:**
  - Crossref records no update or correction for the article, and a Crossref search found no erratum to the series;
  - zbMATH (Zbl 1372.11054) confirms pages 325–402.

All sources were accessed on 22 September 2026.

## Mistakes found (`sourceIssues`)

All five are misprints with reach "nothing". None is corrected in the accepted manuscript; the published text was not available.

| Id | Where (accepted manuscript) | Printed | Should be |
|---|---|---|---|
| E1 | §2.1, p. 5 | Λ = Z/Z_c ≅ Z^m | Z^k (the basis has k elements) |
| E2 | §1.1, p. 4 | "a finite place of v" | of F |
| E3 | Theorem 3.3(i), p. 21, and §3.5, p. 27 | X has exponent [1, 0, 1] | [1, 0, −1], as in Theorems 2.3 and 2.5; [1, 0, 1] belongs to Y only |
| E4 | proof of Theorem 6.2, p. 45 | E_2 = F_2 · F_1 | F_2 · E_1 (F_2 · F_1 = F_2 is totally real) |
| E5 | proof of Proposition 7.6, p. 49 | "E and π are unramified above l" | Π |

**Leads checked but not recorded:**

- **The factor 5 in Lemma 7.5's final estimate.** It is present in the layout text ("5·|Σ…| < l^{f_v} − 1"). The argument that α_2/α_1 has order greater than 5 is correct.
- **Consistency checks that passed:**
  - the counts 4^{s+1}/2 and 2^s in Theorems 3.8(1) and 3.10(1);
  - the ranks a + b and a + 3b in the proof of Theorem 4.2;
  - dim Y_k^B and dim Z_k^B for k = 3, 4;
  - b = (l − 1)/2 in the proof of Theorem 6.2.
- **A correction to the earlier paper.** Inside the proof of Proposition 4.1 the paper corrects the proof of [CT15, Lemma 4.3]. That is a correction to the earlier paper, not a mistake here. It is noted on item 032 for whoever extracts CT15.

## What the atlas and the libraries already have

**Libraries.** At the pinned commits:

- Mathlib has Coxeter systems and their length function, and matrix unitary and symplectic groups.
- Tau Ceti has abstract Tits systems with the Bruhat decomposition, and Shimura's abstract double-coset Hecke rings.

Neither library has Iwahori–Hecke algebras with their presentations, p-adic reductive groups, buildings, admissible representations, Jacquet modules, L-packets, automorphic representations, deformation rings or algebraic modular forms. So **no item is `library`**.

**The atlas:**

- **ModularityAndLanglandsExtensions.**
  - ML.3 plans "Newton–Thorne source-scoped symmetric-power automorphy".
  - ML.4 plans the "Arthur/Mok/KMSW classification inputs" (items 018, 020, 023, 024; with ET.0 for item 019).
  - ML.5 plans "cyclic base change, automorphic induction and selected tensor/symmetric-power transfers" (item 047).
  - The Newton–Thorne extraction (PAPER-NEWTON-THORNE-26) already routes its endpoints as sources of ML.0/ML.3/ML.5.
- **EndoscopicTransferAndUnitaryTraceComparison.** ET.4 and ET.7 plan the unitary stable and twisted trace formulas and base change (item 024). ET.1 plans the Langlands–Shelstad transfer factors, but not Lemma 3.6's explicit computation.
- **ReductiveGroupsPartII.** RG2.2 and RG2.4 plan Bruhat–Tits buildings and the Iwahori–Bruhat decomposition (item 004).
- **Galois representations and ordinarity.** AutomorphicGaloisRepresentationsPartII AG2.0/AG2.2/AG2.5 plans the Galois representations and local–global compatibility with monodromy, and PotentialAutomorphyInfrastructure PA.2 plans ι-ordinarity (items 002, 003).
- **AutomorphicFormsOnReductiveGroups.** AF.5 plans algebraic modular forms as functions on adelic double cosets; it is named in item 031's note.
- **Planned nowhere:**
  - level-raising for GL_n or unitary groups (the only level-raising layer is ModularCurvesPartII R14.4, Ihara for GL_2);
  - Iwahori–Hecke algebra presentations;
  - Kazhdan–Lusztig;
  - Thorne's residually reducible deformation theory.
- **Related proposal on main.** The Boxer–Calegari–Gee extraction proposed a Part II PolarizedAutomorphyLifting (parent PotentialAutomorphyInfrastructure) for polarized automorphy lifting on definite unitary groups: Thorne 2012/2017, Geraghty and BLGGT §2. It does not cover Thorne 2015, and it is not yet designed.

## Routes

**1. Source: ModularityAndLanglandsExtensions ML.0, ML.2, ML.3** (items 001, 050–056). This route takes the endpoints and the generic symmetric-power arguments:

- the definition of "Sym^n π exists";
- Theorem 6.1 and Corollary 7.2 (with Corollaries 1.2–1.3);
- the §7 reductions: Theorem 7.1, Lemmas 7.4–7.5, Proposition 7.6, and the BLGGT14 potential diagonalisability inputs.

ML.3 asks to "record weight, level, field and regularity assumptions per source", and these theorems keep their own hypotheses (linear disjointness from Q(ζ_5), Q(ζ_7), Q(ζ_35)). They are superseded in range, by another method, by Newton–Thorne.

**2. Source: SmoothRepresentationsOfLocalGroups SR.1–SR.3** (items 005, 006, 008, 013). These are four general results of local representation theory, planned nowhere:

- Casselman's lemma on Iwahori invariants and Jacquet modules (Lemma 2.1);
- the Iwahori–Matsumoto presentation of the Hecke algebra of a Tits system;
- the Bernstein–Lusztig presentation;
- Kazhdan–Lusztig's classification of tempered Iwahori-spherical representations (Theorem 2.4).

**3. Source: LocalGaloisDeformationRings L7** (items 036, 037). The rings R^m_v bound the monodromy by a partition, using Taylor's Pol_n(m, q_v). Lemma 5.2 describes their smooth points and minimal primes. L7 plans "semistable, Steinberg and minimally ramified analogues away from p for rank n, preserving the nilpotent monodromy operator", which is exactly this direction. The ordinary, R^χ and Steinberg rings are named in item 036's note as planned in L7 and R08.2.

**4. Part II: "Modularity, automorphy and Langlands endpoint extensions, Part II: symmetric power functoriality by level-raising on definite unitary groups"** (`SymmetricPowersByUnitaryLevelRaising`, area `automorphic`, 33 items). It takes the method:

- §2's modules and integral structures;
- §3's packet identification and compact transfer counts;
- §4's automorphic level-raising;
- §5's Galois level-raising and Theorem 5.7, with Thorne 2015 as a stated input;
- the congruence and Theorem 6.2.

It is a Part II rather than part of ML.3 because ML.3 records endpoints, and this is a 50-page proof with its own infrastructure. The Boxer–Calegari–Gee extraction made the same choice for level-one change of weight (`LevelOneCuspidalCohomologyGLn`).

- **Imports** (in the brief):
  - ML.4, ML.5 and the ML source route;
  - ET.0, ET.1, ET.4, ET.6, ET.7;
  - SR.1–SR.3 with route 2;
  - RG2.2, RG2.4;
  - AF.5;
  - AG2.0/AG2.2/AG2.5;
  - PA.2;
  - L7/R08.2 with route 3, and G7.
- **Tests:**
  - n = 7 and 9, with Reeder's matrices and the Jacquet-module counts;
  - Remark 4.5's failure for l > 7;
  - R^{(n)}_v = R^St_v.

## Judgement calls for the reviewer

- **Where Thorne 2015 and Theorem 5.7 live.** They are routed into this Part II. They could instead join the proposed PolarizedAutomorphyLifting Part II when it is designed, since both concern automorphy lifting on definite unitary groups. The brief asks the two design jobs to agree which one owns them.
- **Kazhdan–Lusztig as a source of SR.3.** It is a deep theorem, and SR.3's description does not name it. A reviewer may prefer a separate Part II of SmoothRepresentationsOfLocalGroups for Iwahori-spherical representation theory.
- **Endpoints routed as a source, not into the Part II.** Theorem 6.1 and the §7 reductions go to ML.3 as a source, while Theorem 6.2 goes to the Part II. The line is drawn between the final endpoint, which ML.3 owns, and the method's own theorem.

## Prerequisites not yet covered by the atlas

These are listed in the result with DOIs checked against Crossref:

- **The series and Thorne's lifting theorem:**
  - Clozel–Thorne I (Compositio 2014) and II (Annals 2015), the direct predecessors, which are not in the paper batches;
  - Thorne 2015 (JAMS).
- **L-packets and local representation theory:**
  - Mok (Memoirs 2015);
  - Mœglin (Pacific J. Math. 2007);
  - Kazhdan–Lusztig (1987);
  - Reeder (2000);
  - De Concini–Lusztig–Procesi (1988);
  - Lusztig (1989).
- **Trace formula and transfer:** Clozel–Harris–Labesse (2011, with Labesse's CM base change).
- **Automorphy lifting and transfers:**
  - Barnet-Lamb–Gee–Geraghty–Taylor (2014);
  - Taylor (2008);
  - Thorne (2012);
  - Geraghty (Math. Ann. 2019);
  - Ramakrishnan (2000).

## Review (REV-PAPER-CLOZEL-THORNE-17, 23 September 2026)

The review accepted the extraction after corrections made in place, and added four routes. It was done by Claude Code (session cc-38267a), and the full record is `research/blueprint/reviews/REV-PAPER-CLOZEL-THORNE-17.md`. Three checkers read the accepted manuscript against its page images; the coordinator re-derived every substantive finding.

- **Corrected: 35 items.** The material ones:
  - 006 and 013 copied two errors of the paper (the Iwahori–Matsumoto relation; Theorem 2.4(a));
  - 026: π_H in Proposition 3.7 is the (1, n − 1) packet;
  - 048: π′_2 is ramified above u_0.

  Items 002, 048 and 055 were split so that ι-ordinarity, [CT14], [CHT08, Lemma 4.1.4] and BLGGT14 Theorem 4.2.1 each have the owner the Newton–Thorne reviews gave them.
- **New: 25 items** (8 planned, 17 missing), 81 in total. They include:
  - Borel–Casselman, the §2.3 definitions and the duality for Y;
  - the U(4) Jacquet lemma, the Jacquet form of (3.7) and the membership of X′, Y′ in the packet;
  - the corrected semistability argument, and the preliminary reductions of Theorem 5.1;
  - the Thorne 2015 inputs, and the reduction of Theorem 6.1 to Theorem 6.2;
  - coefficient conjugation, Dickson and Fontaine–Laffaille.
- **Routes:**
  - The Part II (route 4) is accepted, and the owner question left open is settled: Thorne 2015 goes to PolarizedAutomorphyLifting (route 5), while Theorems 5.1 and 5.7 stay.
  - The Iwahori–Hecke presentations and Kazhdan–Lusztig's classification move to SmoothRepresentationsPartIIParahoricCenters (route 6).
  - The congruence (1.1) moves to ArithmeticGaloisRepresentations G7 (route 7), with the Newton–Thorne decomposition.
  - [CHT08, Lemma 4.1.4] and coefficient conjugation go to AutomorphicGaloisRepresentationsPartII (route 8).

  Eleven prerequisites were added.
- **Source issues:** E1–E5 are confirmed, and E1's quotation was corrected; E6–E23 are new.
  - The most important is E7: one entry of the n = 9 Hecke matrix T_{s₂} is wrong, so the printed matrices do not satisfy the Hecke relations.
  - The next are:
    - E8: Theorem 2.4(a) forces u = 1;
    - E10: a false uniqueness claim in §3.5;
    - E20: primitivity of r_{𝔭₀} is unproved;
    - E21: Lemma 5.3 is proved only for unipotent conditions;
    - E22: Theorem 6.2 needs F(ζ_l) ⊄ F(ad ρ̄) for Theorem 5.7(4);
    - E23: the descent in Theorem 7.1 is ambiguous up to η_{E/F}.
  - All have direct repairs, and none affects Theorem 1.1 or Corollaries 1.2–1.3 under their stated hypotheses.
