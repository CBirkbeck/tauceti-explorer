# Benoist–Wittenberg I: extraction and routing checkpoint

Issue #1296 · Codex · session codex-a71f92 · 22 September 2026

Status: **partial**. The entire published paper was read, but its transitive proof-input inventory is not closed. This checkpoint contains 182 items: 7 pinned-library items, 9 existing-roadmap imports and 166 missing items. Seven routes take 165 missing items exactly once. One printed false signature is quarantined rather than routed. Forty-six definitions/constructions have usage-derived APIs and at least three mathematical test contracts each. No Lean implementation or compilation is claimed.

## Source and extent

The primary text is the authors' publicly hosted [published 77-page article](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), *Inventiones mathematicae* 222 (2020), 1–77, [DOI](https://doi.org/10.1007/s00222-020-00965-8). Every section, proof and reference was read. The 67-page revised preprint linked from Wittenberg's homepage has different pagination; it was not substituted for the published version. The JSON records the primary SHA-256 and exact read extents and hashes of nine supplementary PDFs. Access date is 2026-09-22.

Supporting proof reads include Kollár's devissage and Euler-characteristic congruences; Benoist's sign-class/coniveau arguments; the entire cited Totaro valuation/specialization proof in both its author and published versions; Colliot-Thélène–Voisin's diagonal-support and unramified-defect arguments; selected Edmundo–Prelli duality proofs; CHK's full axiomatic §5.1 and homotopy-invariance §5.3; and CTSS Corollaire1's coefficient-limit argument. These are selected reads, not claims to have read those entire works. The limited previous-session Voisin read is explicitly identified as such.

The main result connects two questions: which cohomology classes of a real locus come from algebraic curves, and whether a real-empty variety contains a geometrically irreducible curve of even geometric genus. It answers them conditionally through real integral Hodge theory, Picard torsion and equivariant duality, then identifies an unramified obstruction and controls torsion 1-cycles. It does not prove real integral HC for every rationally connected variety. Part II's quartic results are external inputs. See §§3–5 of the [primary paper](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf).

## A source-boundary correction requiring review

Theorem3.16(ii), printed p.55, and introductory TheoremA(ii), allow dimension one in their even-genus equivalence. The proof invokes Proposition3.9, which requires dimension at least two in the real-point case. The following counterexample is a deduction made in this extraction, not a claimed published erratum.

Take the smooth elliptic curve E: y²=x³−x over ℝ, with its point at infinity. It has H²(E,O_E)=0. The 1-cycle Hodge property is codimension zero and holds. Its real point splits the Brauer descent obstruction, so Pic(E)→Pic(E_C)^G is an isomorphism, including on 2-primary torsion. Yet the only integral closed one-dimensional subvariety of E is E, whose geometric genus is one. Thus the printed right-hand side holds and the left-hand side fails.

Item `printed-even-genus` preserves that printed signature and counterexample, has no route, and must not become an implementation target. Item `main-even-genus` records the proof-supported version with the added hypothesis **dim X≥2 or X(R)=empty**. The real-empty curve case is covered by Geyer. The final Pic(X_C)[2]=0 corollary remains valid in dimension one, since it forces genus zero. Independent review should check this distinction against the [printed statement and proof](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf#page=55).

A second boundary correction is needed in the paragraph before Example2.5: the “constant” ω^{2k} assertion needs **positive even k**. For k=0, ω⁰ is the integral unit, not a torsion class, and is admissible even when real points exist. The corresponding item makes that exception explicit.

## Ownership decisions

| Route | Existing owner or shared extension | Missing items |
| --- | --- | ---: |
| Source | SchemeAndStackFoundations:SF.2 | 21 |
| Source | SchemeAndStackFoundations:SF.5 | 5 |
| Source | MotivesAndAlgebraicCycles:MC.0 | 3 |
| Source | MotivesAndAlgebraicCycles:MC.2 | 27 |
| Source | MotivesAndAlgebraicCycles:MC.7 | 58 |
| Part II | EquivariantTopologyRealVarieties | 48 |
| Part II | QuadraticFormsRealFunctionFields | 3 |

The two Part II IDs are the **same proposals already recorded in PAPER-BENOIST-19**, not competing owners. Their matching parent IDs, titles and areas are retained. They have not been treated as accepted atlas layers merely because a paper checkpoint proposes them. Integration should coalesce their source briefs.

### Sites, support and coniveau

SF.2 owns the site/cohomology/comparison direction. It receives the exact real étale comparison and a named cohomology-with-supports/Cousin-resolution suffix. The CHK signature is precise: an infinite base field, an étale-stable category closed under the required projective-line construction, localization, étale excision and the key lemma; support homotopy invariance supplies the latter. Purity identifies the E1 terms and twists, whereas strict effaceability supplies the flasque resolution and E2 identification. These are distinct proof steps. See [CHK §5](https://webusers.imj-prg.fr/~bruno.kahn/preprints/bo.pdf).

The coniveau in SchemeKTheoryOperations:S.4 and MotivicEtaleKTheory:M.6/M.6a is K-theoretic. The arithmetic Kato complex in PAPER-DITTMANN-POP-23 belongs to HigherLocalFieldsAndHigherClassFieldTheory:HL.6 and has different residue terms. Neither is an existing implementation of BW's equivariant cohomology sequence. General norm-residue theory is imported from M.5, never duplicated here.

SF.5 receives intermediate Euler-characteristic indices and the finite-map/algebraic-equivalence congruences, using its existing Chow/intersection/Riemann–Roch direction. Kollár's index is the generator of the ideal of coherent Euler characteristics with bounded support dimension; over a nonempty real variety the zero-cycle index is one or two. The finite-cover genus argument uses a congruence modulo the target point index, not an equality of Euler characteristics. See [Kollár Proposition4, Lemma5 and Proposition14](https://arxiv.org/pdf/1312.3923v2).

### Cycle realizations and selected Hodge cases

MC.0 owns correspondences and decomposition-of-diagonal actions. Universal zero-cycle support belongs there. MC.2 owns real-equivariant/Borel–Haefliger realizations, their proper-pushforward and cup compatibilities, admissible subgroups, norm and real-component maps, and the Bloch torsion realization. The geometric étale cycle map remains an import from EDC.3; general Chow operations remain SF.5's.

MC.7 already explicitly includes proof-scoped selected integral Hodge cases for divisors and curves. It therefore receives the real integral Hodge definitions, exact orthogonality, corrected even-genus criterion, examples, unramified obstruction and conditional torsion calculations. A separate new real-cycle roadmap would duplicate that existing direction. Broad predicates are kept separate from their proved special cases and from the paper's open questions.

The correct integration order needs finer sublayers than the current broad stage labels. SF.2's early sites/comparison precede M.5; its norm-residue-dependent coniveau suffix follows it. MC.2's early cycle maps precede MC.7's divisor/zero-cycle cases, which supply later compatibility applications. Do not create a blanket SF.2↔M.5 or MC.2↔MC.7 stage cycle. The 182-item dependency graph is acyclic; the fine-grained atlas integration is an explicit open task.

### Shared equivariant topology

All eight upstream Algebraic Topology stage descriptions were read. They provide ordinary chains, products, local coefficients, finite-cover descent and manifold duality, not C2 fixed-locus equivariant cohomology or Steenrod squares. The same Part II already proposed for Benoist19 receives the semialgebraic extension, sign twists, equivariant purity, parity decompositions, γ-splittings, corrected self-dual sequence, affine/Lefschetz bounds and the Wu pushforward formula.

General real-closed definable geometry is imported from LogicAndDefinabilityInNumberTheory:LD.6, also used by the BKT20 route. Derived categories, the generic sheaf-H carrier, cyclic group resolutions and representation-theoretic Shapiro are imported from the pinned library. No second carrier for any of them is proposed.

The brief preserves the exact endpoints: finite Borel approximation uses i<n; Proposition1.7 requires j≡d−1 mod2; Proposition1.8 uses p<i−d; weak Lefschetz distinguishes i=d+1 from i>d+1. It also retains the γ factor in the dual real-block pairing. These details come from [§1 of BW](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf).

### Shared quadratic-form extension

The three real-function-field inputs reuse Benoist19's QuadraticFormsRealFunctionFields proposal: the no-real-curve two-square theorem, the level/sign-symbol comparison, and the anisotropic-quadric seven-square bound. They import upstream quadratic forms, M.5 norm-residue and the existing higher-Pfister direction. The scalar field is any real closed R, not only ℝ. The precise Witt/Pfister proofs remain open prerequisites.

## Conventions and regression boundaries

The JSON uses concrete mathematical objects, not theorem-shaped opaque properties.

- Over arbitrary real closed R, X(R) carries its semialgebraic site; ordinary singular comparison is restricted to ℝ. Borel/sheaf equivariance is not identified with Bredon equivariance.
- Coefficients use Z(j)=i^jZ with parity sign action. Cohomology supported on X(R) and relative cohomology defined by extension by zero from its complement are distinct.
- Mod-two fixed-locus multiplication is convolution. Integral decomposition retains a possible top integral summand, and reduction is 1+β_F; the same convolution formula is not asserted integrally.
- The Steenrod pushforward operator is not degree-preserving. The real component of an equivariant cycle is controlled by all the required even-square conditions, not merely vanishing at real points.
- Universal surface support means support after **every algebraically closed extension C'/R**. The single field C=R(i) does not suffice in the general statement. The generalized Bloch conjecture mentioned in Remark5.3 is not a proved replacement.
- Lemma5.6 is stated under the full §5.4 hypotheses, because its proof uses the vanishing supplied by real integral HC and universal support.
- Proposition5.7's quartic torsion formula remains conditional over arbitrary R. Unconditional conclusions over ℝ need Part II. The full Chow group and Fermat calculation in Remark5.10 are assertions with additional unwritten calculations, not closed proofs.

Example4.4's map is anti-linear: every coordinate is conjugated. This was checked in an image of printed p.59, because text extraction loses the bars. Its square has exponents (1,−1,2,−2,3,−3,0) modulo eight. The smooth invariant complete intersection and free-action calculation still need an explicit proof. See [Example4.4](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf#page=59).

For Examples4.7–4.8, Totaro's author Theorem2.1 is published Theorem3.1. The full published proof was read. The extra base-coordinate factor producing bidegree (4,4) leaves the generic fiber unchanged; vertical curves have degree zero and must not be treated as finite covers of the base conic. See [Totaro's published article](https://doi.org/10.1017/fms.2013.3).

## Library and catalogue audit

Checked pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Exact declarations were read for all seven library items:

- `IsRealClosed`;
- `DerivedCategory`, `HasDerivedCategory` and `DerivedCategory.Q`;
- `CategoryTheory.Sheaf.H`, its degree-zero equivalence and maps;
- `AlgebraicGeometry.AlgebraicCycle`, weighted map and identity law;
- `Rep.FiniteCyclicGroup.groupCohomologyIso₀/Even/Odd`;
- `groupCohomology.coindIso`;
- `TauCeti.Hodge.HodgeStructureOn/HodgeStructure`.

The library cycle carrier is not CH, the Hodge carrier is not geometric Hodge theory, and representation cohomology is not equivariant sheaf cohomology. Reviewed audits read include AUDIT-01 SF.2/4/5, AUDIT-02 Hodge L0, AUDIT-18 EDC.2/3 and AUDIT-30 M.5 variants. An absent MC/LD reviewed audit entry is not used as evidence of absence.

Both pinned trees were screened for the specific missing theories; actual near matches were inspected. Current upstream-shape checks found the [Eilenberg–Steenrod axioms PR](https://github.com/leanprover-community/mathlib4/pull/38369) and [relative singular homology PR](https://github.com/leanprover-community/mathlib4/pull/37659), not Steenrod square operations. Their work remains in the ordinary-topology import direction.

The catalogue snapshot was `1c16a3cd24b5b8e55dee3f5ef2fef8dd054bee96`, compared with main `c8906d208bbf254080dbfa3f1d018ae719174809`. That difference affects paper/handoff/queue files, not catalogue or reviewed audits. New Benoist19/BKT20 routes were checked separately. Full MC and nearby upstream Hodge/QuadraticFormInvariants documents supplied the granularity and ownership model. Roadmap JSON, packets, decompositions, reserved IDs and relevant K-theory/definability stage descriptions were checked.

## Why this is not complete

Twenty named gaps give exact consuming items and resumption instructions. The largest are semialgebraic foundations/duality, comparison and real-site exactness, Steenrod/Wu proofs, CHK's geometric presentation and effacement proof, Kerz Gersten, real Bloch Abel–Jacobi, Witt/Pfister, Picard descent, decomposition of the diagonal and surface/quartic calculations. CTSS's coefficient-limit statement has now been read, but its full construction and identification with λ have not. The van Hamel primary PDF could not be fetched; its repository metadata is linked in the prerequisite list.

There are also explicitly unextracted secondary remarks: the precise barred-γ integral multiplication formula in Remark1.9, Karpenko's counterexample in Remark3.13, and the K3 example in Remark3.21(ii). Broad imported foundation interfaces still need declaration-level suppliers. Main-paper reading is complete; transitive extraction and source-faithful proof closure are not.

The handoff prioritizes these gaps. The seven source/Part II routes are proposals for review, not an assertion that all of their mathematical inputs have been proved or formalized.

## Checks

Passed `scripts/check_paper.py` using the current catalogue snapshot. A separate read-only audit checked unique IDs, all internal references, acyclicity, exact single routing, planned-stage/source ownership, Part II parent validity, definition APIs/tests, gap consumers, ten PDF hashes, and absence of local paths in the deliverables. Small executable checks verified the parity cutoff for 1-cycle coniveau, quartic valuation residues, the anti-linear order-sixteen calculation, genus parity under odd/even covers, and the rank-thirty arithmetic.

The 138 definition/construction test contracts are **not executed Lean tests**. This paper issue authorizes JSON, report and handoff only; no suggested Lean file was written or compiled.
