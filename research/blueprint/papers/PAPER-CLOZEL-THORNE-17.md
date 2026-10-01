# PAPER-CLOZEL-THORNE-17: extraction and routing

Issue #1336. Claude Code, session cc-442dc5. The extraction is complete. Implementation and proof closure are not claimed.

Laurent Clozel and Jack A. Thorne, *Level-raising and symmetric power functoriality, III*, Duke Math. J. 166 (2017), 325–402 (doi 10.1215/00127094-3714971). The paper is not on arXiv.

The current result has **81 items: 17 planned and 64 missing**, with no composite item
classified as a library theorem. All 64 missing items have exactly one route:

- ModularityAndLanglandsExtensions ML.0/ML.2/ML.3: 11 endpoint/source items;
- SmoothRepresentationsOfLocalGroups SR.1–SR.4: five source items, including the shared concrete Iwahori presentation;
- LocalGaloisDeformationRings L7: two source items;
- SymmetricPowersByUnitaryLevelRaising: 38 missing items;
- PolarizedAutomorphyLifting: five missing items;
- SmoothRepresentationsPartIIParahoricCenters: two missing Kazhdan–Lusztig items;
- ArithmeticGaloisRepresentations: two source items;
- AutomorphicGaloisRepresentationsPartII: three source items.

There are **23 active source issues**, E1–E21 and E23–E24. E22 is a retracted audit
observation, preserved with its original independent verdict under
`resolvedSourceObservations`. The fixes for [issue #5516](https://github.com/CBirkbeck/tauceti-explorer/issues/5516),
by Codex, session `codex-rtOQ9t`, await independent fix review. See
[the fixes report](../redteam/RT-PAPER-CLOZEL-THORNE-17.fixes.md).

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
5. **Galois-theoretic level-raising (§5).** Deformation theory of the reducible residual representation, with a new local condition R^m_v bounding monodromy by a partition (Lemmas 5.2–5.6; Lemma 5.3 has the unipotent restriction at R_0), upgrades this to a lift that is Steinberg at some place (Theorem 5.1).
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

The original extraction recorded the following five misprints with reach "nothing". The accepted review added E6–E23. The present fixes retract E22 and add E24, leaving 23 active records. The original five remain as historical provenance; these issues have not been compared with the unavailable journal printing.

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
  - the full concrete Iwahori–Hecke coefficient interface is assigned as missing source work to SR.1/SR.4, shared with Kisin–Pappas and Venkatesh;
  - Kazhdan–Lusztig;
  - Thorne's residually reducible deformation theory.
- **Related proposal on main.** The Boxer–Calegari–Gee extraction proposed a Part II PolarizedAutomorphyLifting (parent PotentialAutomorphyInfrastructure) for polarized automorphy lifting on definite unitary groups: Thorne 2012/2017, Geraghty and BLGGT §2. The accepted review assigned Thorne 2015’s general inputs to that same proposal; Clozel–Thorne’s own Theorems 5.1 and 5.7 remain in the level-raising Part II.

## Routes

**1. Source: ModularityAndLanglandsExtensions ML.0, ML.2, ML.3** (items 001, 050–056). This route takes the endpoints and the generic symmetric-power arguments:

- the definition of "Sym^n π exists";
- Theorem 6.1 and Corollary 7.2 (with Corollaries 1.2–1.3);
- the §7 reductions: Theorem 7.1, Lemmas 7.4–7.5, Proposition 7.6, and the BLGGT14 potential diagonalisability inputs.

ML.3 asks to "record weight, level, field and regularity assumptions per source", and these theorems keep their own hypotheses (linear disjointness from Q(ζ_5), Q(ζ_7), Q(ζ_35)). They are superseded in range, by another method, by Newton–Thorne.

**2. Source: SmoothRepresentationsOfLocalGroups SR.1–SR.4**
(items 005, 061, 062, 006, 008). Casselman, Borel–Casselman and the notation
inputs retain their original supplier. Items 006/008 supply the common concrete
Iwahori–Matsumoto/Bernstein–Lusztig presentation at the shared **SR.1/SR.4**
interface recorded by Kisin–Pappas route 11 and Venkatesh item 29. This is a
missing source contribution, not a claim that the existing layers already prove
all coefficient regimes. Route 6 imports it and retains the additional
Kazhdan–Lusztig classification/standard modules and its generic extensions.

Over Z, the corrected presentation uses the positive braid monoid. The braid-group
presentation requires q invertible; the inverse is q^{-1}(T_s−(q−1)). For the
Bernstein subalgebra over O retain l≠p and a chosen square root of q. The generic
specialization v↦q^{1/2} must preserve the concrete basis, Bernstein subalgebra
and Jacquet-exponent action. Venkatesh’s split q=1 modular specialization needs
its separate S=Z/l^r, q≡1 mod l^r, l prime to |W| and averaging-volume
hypotheses. It supplies no proof of the other coefficient regimes. The abstract
Tau Ceti double-coset algebra and degree map are reused.

**3. Source: LocalGaloisDeformationRings L7** (items 036, 037). The rings R^m_v bound the monodromy by a partition, using Taylor's Pol_n(m, q_v). Lemma 5.2 describes their smooth points and minimal primes. L7 plans "semistable, Steinberg and minimally ramified analogues away from p for rank n, preserving the nilpotent monodromy operator", which is exactly this direction. The ordinary, R^χ and Steinberg rings are named in item 036's note as planned in L7 and R08.2.

**4. Part II: "Modularity, automorphy and Langlands endpoint extensions, Part II: symmetric power functoriality by level-raising on definite unitary groups"** (`SymmetricPowersByUnitaryLevelRaising`, area `automorphic`, 38 missing items). It takes the method:

- §2's modules and integral structures;
- §3's packet identification and compact transfer counts;
- §4's automorphic level-raising;
- §5's Galois level-raising and Theorem 5.7, with Thorne 2015 as a stated input;
- Theorem 6.2, importing the congruence from ArithmeticGaloisRepresentations G7.

It is a Part II rather than part of ML.3 because ML.3 records endpoints, and this is a 50-page proof with its own infrastructure. The Boxer–Calegari–Gee extraction made the same choice for level-one change of weight (`LevelOneCuspidalCohomologyGLn`).

- **Imports** (in the brief):
  - ML.4, ML.5 and the ML source route;
  - ET.0, ET.1, ET.4, ET.6, ET.7;
  - SR.1–SR.4 with route 2 for the common presentation/coefficient interface, and route 6 for Kazhdan–Lusztig;
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

- **Where Thorne 2015 and Theorem 5.7 live.** The accepted review settled the original choice: general Thorne 2015 inputs are in PolarizedAutomorphyLifting; the paper’s Theorems 5.1 and 5.7 stay in SymmetricPowersByUnitaryLevelRaising.
- **Kazhdan–Lusztig.** The classification and standard-module results belong to the Part II. The common concrete Iwahori presentation has the upstream SR.1/SR.4 source owner.
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
  - Historically the review moved both presentations and classification to route 6. Fix #5516 reconciles the later Kisin–Pappas coalescence: the shared concrete presentations are in route 2, and the classification remains in route 6.
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
    - E22: the review alleged a missing cyclotomic hypothesis. The confirmed red-team verification retracts this conclusion: Theorem 6.2(3) and the S-split argument already verify Theorem 5.7(4). The original review file is unchanged;
    - E23: the descent in Theorem 7.1 is ambiguous up to η_{E/F}.
  - All have direct repairs, and none affects Theorem 1.1 or Corollaries 1.2–1.3 under their stated hypotheses.

## Corrected theorem contracts

**The integral presentation (006; E24).** The accessed manuscript’s use of
Z[B_W] is a coefficient error separate from E6’s sign. Every braid-group
generator is a unit, whereas the unital degree character sends [BsB] to q>1
in Z. The integral algebra therefore uses positive braid generators with
braid and quadratic relations. This preserves the application over O with
l≠p, where q is a unit. E24 is scoped to the accepted manuscript pp.6–7;
the journal printing is unexamined.

**Local and global duality (064–065; route 4).** Theorem 3.3 supplies the
perfect **K-valued** pairing on Y_K^B used in Proposition 2.9, including the
localized K-subspaces and the contragredient anti-involution. It implies no
perfect pairing on a chosen integral lattice. Proposition 2.6 constructs its
lattice under a primitive-root hypothesis; Proposition 2.9 uses q≡−1 mod l,
which has order two rather than l−1 for l=5,7. Its rational matrices remain
available by Remark 2.7. The projector e_P=(1+T_{s_k})/(q+1) exists over
C/K, or in an applicable averaging regime with q+1 invertible. It is not
an integral Hecke element at the level-raising place. Integral Hecke actions
and Bernstein localizations remain separate. The perfect integral **global**
pairing needed for level raising is independently supplied by Proposition 4.3
(item 033), not by local rational self-duality.

**Theorem 6.2 (049; retracted E22).** Its hypothesis (3) makes q_{u_0} a
primitive root modulo l, so arithmetic Frobenius on μ_l has order l−1.
Consequently [F(ζ_l):F]=l−1, which is 4 or 6. The PSL_2/PGL_2 projective
image has abelianization of order at most two and cannot contain that
cyclotomic field. The adjoint field of the residual symmetric power is a
subfield of the original projective field; equality of the kernels is not
needed.

The proof’s auxiliary E_0 has a soluble S-split Galois closure M/F. If its
intersection with the joint residual/cyclotomic extension L/F were nontrivial,
the soluble intersection group would have a simple quotient. That would give
a simple Galois subextension of L/F split at every S-place, contrary to the
choice of S on p.45. Thus L∩M=F, preserving both images and the cyclotomic
degree over E_0. This verifies Theorem 5.7(4). Theorem 6.2 gains no hypothesis.
E22 corrects an earlier audit conclusion, not a mathematical source gap.

**Lemma 5.3 (040; E21).** Under the standing §5.1 hypotheses, at each
v∈R_0 require R_v^1, R_v^St or R_v^m, with v∤l and q_v≡1 mod l.
The bound dim R_D^red≤1+n[L^+:Q]−d and finiteness over Λ_L are stated
with this restriction. A nontrivial-character R_v^{χ_v} version requires a
separate twisting/character argument before it is advertised. The existing
application on p.43 has R_0 empty and remains valid.

## Fix reading and validation

On 2026-10-01 Codex downloaded the actual 53-page Cambridge accepted manuscript,
SHA-256 `fb88e83c3c056c2fa6100d1fbb4d0853c4ec636cc68a33548ac4259336094742`,
and reread pp.6–8,12,17–18,35–36,39–46, including images 7,18,45. This is a
bounded fix reading; the earlier extraction, review and red-team full readings
remain provenance. The publisher’s Crossref download returned HTTP 200 HTML
rather than a PDF, so no journal comparison is claimed. Crossref metadata has
no correction relation; a bounded title/erratum search found no applicable
correction. Author-page fetches failed; an indexed listing was only a lead.
No author was contacted.

The paper checker, intake checks, source-issue/version schema checks, structural
and route checks, exact rank-one coefficient/projector calculations and finite
cyclotomic-order tests passed, as did git diff --check. All 81 IDs and item
classifications remain; only 006/008 move between routes. The independent
review file and historical source verdicts remain unchanged. No Lean artifact
is required or compiled. Independent fix review remains pending.
