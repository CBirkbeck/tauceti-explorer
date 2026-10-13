# BP-HilbertModularVarietiesAndShimuraCurves--R18.3

Agent: Codex — codex-Wlk3qi. Refs #9420. Scope: R18.3 only.

This is a complete target-level planning pass for independent review.
R18.3 is **planned, not closed**. The packet adds 12 supporting targets
(nine theorems, two constructions, one comparison), 13 API items and eight
discriminating tests, cites ten checked baseline declarations, and records
11 supplier requests and five gaps. Every implementation status is unchecked.
No new planet is proposed; retain the six accepted R18.3 planets.

## Starting point and deliverables

The issue names H0 as its predecessor, but that packet has no R18.3 coverage
record or target. The accepted R18.2 packet already contains nineteen R18.3
targets and the six planets. Its independent review and the verified
automorphic-area fixes were read. The new packet imports those nineteen
stable IDs without copying or renumbering them. The reader states all
nineteen interfaces and the twelve new supporting targets, including
definition APIs and their discriminating checks.

The current read-only TauCetiRoadmap and TauCeti library were checked in
addition to the atlas snapshot. Environment revisions were
0d144d044dacebca17b654695b6f1ad58f159b27 and
a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 respectively.
CharacterTheory and IntegralHeckeAndGaloisDeterminants were read for style
and existing interfaces; AdelicAlgebraicGroups was checked for class numbers,
strong approximation and projective neatness. Existing unit square classes,
invariant submodules, double cosets, coefficient lattices and generic Hecke
sums are imported. Generic algebraic modular forms remain AF.5's property.

## Mathematical refinements to retain

- Effective stabilisers are quotiented by scalar \(F^\times\); real quadratic
  central units make the unquotiented stabiliser infinite. AA.5's example
  over \(\mathbb Q\) does not establish the general-number-field result.
- The new projective neat-level theorem shrinks the level without extending
  \(F\). It proves actual smallness and arbitrary base change at that level;
  it makes no field-degree assertion.
- Integral invariant reduction is injective onto its **liftable image**,
  which need not be the whole residual invariant space. The sign action of
  \(C_2\) over \(\mathbb Z_2\) distinguishes these spaces. Twisted
  Taylor–Wiles reductions compare these images.
- The coefficient pairing must be independently perfect in the asserted
  integral range; the weight-four dyadic factorial pairing is not.
- The auxiliary quotient is \(\Delta'_v/\Delta'_v[N]\), by **N-torsion**.
  Free diamond fibres give group-algebra freeness despite nonunit isotropy.
  The cyclic \(C_8,N=2\) computation and the strict dyadic exponent inequality
  distinguish the correct quotient and square-determinant argument.
- Division coefficient actions require a chosen root
  \(r^2=\psi_v(\operatorname{Nrd}\Pi)^{-1}\), rather than arbitrary signs
  when the central character is nontrivial. The inverse right-translation
  convention is recorded. Dyadic ramified-sign control needs full division
  factors at every finite ramified place.
- Localized control uses actual early eigensystem Galois compatibility,
  an Iwahori selected-root calculation and the distinct-root Steinberg
  obstruction. The orbit/freeness and norm-twist calculations themselves
  need no Galois realization.
- Abstract residual polynomial evaluation is maximal by coefficient
  surjectivity. Descent to the acting quotient requires its relations to
  vanish under evaluation; it cannot realize an arbitrary residual system.

## Ownership moves and assembly edits

The binding tier order supersedes the issue's older instruction to add an
upward R17.3 edge. For RT-AREA-automorphic-1/12, move the minimum classical
degree-two local, real-weight and global quaternionic spectral comparison
to the three new R18.3 transfer nodes. R17.3 imports these. AF.4 already owns
the rational-model part. Likewise, move the early eigenform realization and
local compatibility needed by control from R19.2 to the new early-Galois
target; R19.2 imports it. Its proof must use early cohomology and never
Taylor–Wiles control or patching.

For RT-AREA-langlands-2/19, retain the accepted owner decision: R18.3 owns
KW Lemmas 7.1–7.4, Corollary 7.5 and Proposition 7.6 for any admissible
finite \(Q\). R22.2 selects primes and applies these statements. The packet
retains that owner record and AF.5's generic-carrier ownership.

The packet's **dependencyReplacements is an explicit edit specification,
not an applied graph mutation**. Assembly must apply its eight groups:

1. Class set/isotropy: replace AA.5 by AA.3 reduction theory, anisotropic
   norm-one compactness and the existing unit-square result.
2. Norm branch: replace R17.3 and AA.5 by AA.4 strong approximation.
3. Split Hecke normalization: replace R17.3 by AF.5.
4. Definite comparison and R18.4 cohomological eigenspaces: replace R17.3
   transfer and rational-model edges by the new R18.3 transfer and AF.4.
5. Dyadic sign extension: replace R16.2 by DivisionParityCharacter.
6. Localized control: replace R19.2 by the early-Galois, selected-root and
   Steinberg-obstruction targets.
7. Residual Hecke ideal: replace R19.2 realization by AF.5 and the explicit
   acting-factor hypothesis.
8. Dyadic Hecke twist: remove localized control; use the norm twist and
   split double-coset calculation directly.

Keep all nineteen stable target IDs and six planets. Audit the resulting
transitive graph before marking this stage closed. The new nodes have no
higher-tier prerequisites; imported old edges have not been silently
treated as fixed.

## Requests and exact remaining work

The eleven requests are AF.5 (fixed-central-character adelic carrier,
effective evaluation, semigroup coefficients and level/reduction API);
SR.0 (smooth/admissible carriers); SR.2 (normalized induction and Iwahori
calculation); SR.3 (characters and elliptic orthogonality); AF.1 (real
Harish–Chandra carriers); AF.4 (coefficient lattices, duals and rational
multiplicity models); AS.4 (actual discrete spectrum and multiplicities);
AS.6 (degree-two matching trace comparison); R01.1 (continuous rank-two
representations, lattices and specialization); R01.2 (Frobenius and
Weil–Deligne conventions); and R06.5 (geometric weight-two semistable
comparison above \(p\)). They are precise extensions of lower-tier owners,
not new generic theories in R18.

The five gaps are:

1. Collate final Khare, Duke 134 (2006), Lemma 2.2, pp.557–589,
   DOI 10.1215/S0012-7094-06-13434-8. The available arXiv version has an
   unrelated Proposition 2.2; the final PDF was not obtained. Neither the
   projective neatness argument nor Taylor's degeneracy lemma proves the
   missing auxiliary field-degree assertion.
2. Obtain the precise Taylor 1989 congruence/pseudorepresentation proof
   for even-degree fields with no finite discrete-series component, and
   the geometric comparison above \(p\). Carayol alone covers neither.
3. Supply genuine typed integral adelic, local representation and
   cohomological eigensummand carriers. Their full contracts are in the
   reader; the suggested file uses only existing carriers.
4. Apply and verify the assembly edits just specified.
5. Independently examine the unrestricted odd-prime sign inference in
   KW Lemma 7.2(i), proof p.61. When \(q_v\equiv-1\pmod p\) and the residual
   local representation is unramified, the two signs have identical
   unordered residual Frobenius data. The new theorem assumes
   \(1+q_v\ne0\), residual ramification, or the specified cyclotomic
   inertia argument above \(p\). Source finding E-R18.3-1 records this
   as a candidate proof gap; no global automorphic counterexample is
   alleged. Resolve the unrestricted case with an actual global argument
   or extra ramified Hecke data before strengthening the target.

## Sources and validation

Primary texts read: KW's 30 May 2009 author copy, §7 pp.57–67; Taylor
2006 pp.737–748; Jacquet–Langlands §§14–16 pp.232–254; Badulescu–Renard
2009 author preprint §§1.5,9,13.1,18, pp.5–7,18–20,32–33,44–45; Carayol
1986 introduction §§0.1–0.11 and §1 opening, pp.409–414; and the cleared
Platonov–Rapinchuk–Rapinchuk 2023 volume 1, §1.4.2 pp.31–33.
The packet records URLs, editions, dates, hashes and exact locators.
The cleared book was read in place; no source passage or private path is
committed. The two missing source proofs above remain explicit.

Jacquet–Langlands Theorem 16.1's conjectural converse sketch is not used
as a proved converse. Badulescu–Renard gives the proved discrete transfer;
its extended image includes residual representations, so the classical
square-integrable restriction and exclusion of norm characters are retained.
Carayol's even-degree finite-discrete-series hypothesis and away-from-\(p\)
restriction are likewise retained.

The packet checker reports zero errors and zero warnings. Intake's
path/content check reports four files and zero problems. The data-placeholder
check passes. All 31 target declaration names occur in the reader; a simulated
assembly of the 58 retained nodes and twelve additions with the specified
dependency edits is acyclic. This simulation neither edits the accepted packet
nor closes external supplier contracts.
The compact suggested file has four light real-bodied definitions and
representative elementary signatures and examples; it develops no adelic
or Galois theory and has no data definition with a placeholder body.
Lean elaboration was run with lean-check in the existing shared pinned
environment, with available memory above 20 GB. The final 132-line file,
using individual Mathlib and Tau Ceti imports, elaborated successfully:
zero errors and eight expected theorem/example warnings for admitted proofs.
The build pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The existing wrapper
identifies the pinned source build; Mathlib's revision was also checked directly.
No build, update, cache download, language server or new Lake project was used,
and no compiler is left running. Elaboration covers the elementary signatures
only; it does not verify the heavy README targets.

Nothing in the scratch directory is needed to review or continue this work.
This worker submits this one job and claims no second one.
