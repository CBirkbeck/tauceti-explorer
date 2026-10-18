# Independent review: StableReductionPartII, MC.5

**Accepted after corrections.** Reviewer: Codex, session `codex-sGD99R`,
2026-10-18. Job `REV-StableReductionPartII--MC.5`, issue #8941. The authoring
session was `codex-ebL2PU`; this reviewer did not author the input.

This accepts a complete target-level planning pass. MC.5 remains **planned**,
with seven explicit supplier gaps and five requests, and no closed stage.
The plan distinguishes a rational Chow equality, an integral line-isomorphism
existence statement, and a choice of such an isomorphism. None is claimed to
be implemented.

## Inventory and node decisions

Read all nine local support nodes and all thirteen MC.5 base targets, including
their statements, proof sketches and dependency overlays. The local nodes are
one construction, one definition, two comparisons, four theorems and one lemma.
The packet now records individual verdicts for all 22 targets. No node was added
or removed. There are 33 API items and 33 worked tests across the local nodes,
two proposed supplier contracts and four inherited-definition interfaces
(respectively 8/13/12 API items and 8/12/13 tests). The five combined MC.5 planets
are retained; the checker counts only the one planet local to this part.

| Local node suffix | Decision and proof check |
| --- | --- |
| `universal-dualizing-pairing` | Corrected metadata. Actual chartwise lines descend through the line-stack equivalence with coherent arbitrary-base-change maps. The untwisted dualizing degree is even. GDET, GPAIR and NODAL-BC are genuine incoming obligations. |
| `hodge-determinant-cohomology` | Verified. Connected-fibre trace and Serre duality identify the underlying determinant lines with the ordinary Hodge determinant. The grades g−1 and 1−g are not the Hodge rank g; no equality of those grades is claimed. |
| `noether-defect-line` | Corrected its boundary test. The obstruction is λ¹²⊗P∨⊗O(−Δ). At one split node xy=π^m, the canonical rational section of the boundary factor has order −m. An unspecified rational section of the entire obstruction line has no determined order. Class zero gives existence, not a preferred trivialization. |
| `pairing-chern-on-moduli` | Corrected source qualification. The published graded K-group theorem on divisorial bases is not directly a stack-Chow theorem. The Hilbert-quotient/equivariant comparison remains CHOW-PIC. Added the local display typo E18 without changing the intended Proposition 6.8 or Corollary 6.9. |
| `rational-defect-torsion` | Verified. Vanishing in Pic⊗Q gives some torsion exponent, not necessarily 12 and not integral triviality. The character line on Bμ_r distinguishes those claims. |
| `torsion-cover-boundary-monodromy` | Corrected source verdicts. The action nerve retains inertia, boundary smoothing loops kill Dehn twists, and twist generation kills the character. Extension from the dense smooth locus uses normality. Hall's proper-DM comparison applies to Bμ_r; it is not applied as a DM-target theorem to BG_m. TOPOLOGY remains explicit. |
| `complex-trivialization-rational-descent` | Verified. Proper-stack H⁰ field base change makes the rational space one-dimensional after a complex trivialization; a nonzero rational vector evaluates to an isomorphism by faithful flatness. DESCENT is not silently supplied by scheme base change. |
| `vertical-divisors-on-stable-moduli` | Verified. Regularity, integrality and irreducible reduced prime fibres reduce vertical divisors to integer multiples of whole fibres with multiplicity one. A finite rational product of primes removes them. The stack Cartier/Weil comparison remains DIVISORS. |
| `noether-arbitrary-base-pullback` | Verified. Pull back an actual universal isomorphism to any base. The pulled-back boundary line and section always exist; the Cartier-divisor interpretation requires the stated generically smooth integral Noetherian hypotheses. Universal signs may coincide in characteristic two; other family units are possible. |

For the thirteen inherited targets, checked ordinary Hodge rank/determinant,
forgetting and both clutching comparisons, boundary and thickness, rational
Noether, complex torsion-freeness, integral Picard injection, integral Noether,
universal units and the semi-canonical convention. The genus-zero, odd-block
exchange, ordered-residue, nonsplit-node and extra-family-unit checks agree with
the retained hypotheses. Existing targets remain imports, not duplicate nodes.

## Corrections made

1. Repaired all five current-upstream README URLs: their immutable repository
   paths were missing the `TauCetiRoadmap/` directory. Commits and anchors remain
   the recorded ones.
2. Made the ordinary Hodge determinant's dependency correction explicit:
   `removedPrerequisites` removes its legacy SF.5 edge, while
   `upstreamPrerequisites` imports AV-L0B/L0C and the existing supplementary edge
   imports SF.1 line-stack descent. Documented overlay order. SF.5 still supplies
   rational intersection theory for other targets.
3. Added the required `kind` to all 33 worked tests, including the supplier and
   inherited-definition tests, and mirrored these classifications in the reader.
   Each of the eight definition/construction interfaces has at least three tests.
   The local boundary-factor test now identifies the section whose order is
   calculated.
4. Independently decided E15–E17, added confirmed E18 with locator, counterexample,
   version hash and correction searches, and qualified the Chern consumer's source
   match. Updated the proof and TOPOLOGY references to use only the confirmed
   preprint corrections E16–E17.
5. Strengthened the suggested file's introductory note: it is not exhaustive;
   the reader defines the complete targets, and proving its carrier checks alone
   does not complete MC.5. No Lean signature or proof was altered.
6. Added the per-target independent review and reader acceptance record. Kept
   coverage planned and all seven gaps. No baseline citation was removed or
   replaced, and no ownership was reassigned.

## Source reading and independent source findings

All eleven public PDFs were read at the packet's cited locators; downloaded
hashes agree with its source records. Scanned mathematical displays in Mumford,
Knudsen–Mumford, Deligne and Knudsen III were checked as page images as well.
The following are locator receipts, not section summaries or source passages.

| Source version | Locations independently checked |
| --- | --- |
| Yuan, author version 2024-08-21 | §3.1.1, pp.41–42, Theorem 3.3; §3.1.2, pp.42–43 |
| Mumford 1977, author-hosted journal scan | Definition 5.9 and Theorem 5.10, printed pp.100–102; Lemma 5.14, pp.102–105; rational/integral descent, pp.102–103 |
| Deligne 1987, IAS scan | §§6.1–6.4, printed pp.141–143; Construction 7.2 and (7.2.1), pp.147–149; §§7.4–7.5, pp.150–151 |
| Knudsen–Mumford 1976, journal scan | §1 and Proposition 1, printed pp.20–21; Lemma 2, p.28; bounded-complex determinant, pp.30–32 |
| Eriksson–Freixas i Montplet 2024, published JEP PDF | Definition 1.1, p.258; Propositions 4.14–4.15 and Definition 4.16, pp.286–287; (6.3), Proposition 6.1 and Remark 6.2, pp.310–312; Proposition 6.8 and Corollary 6.9, pp.316–318, including the p.317 display |
| Knudsen 1983 III, journal scan | §4 line definitions, Theorem 4.1(a) and Theorem 4.2(a), printed pp.201–203 |
| Edidin–Graham, alg-geom/9609018v3 | §2.4, Theorem 1, Lemma 2 and Corollary 1, pp.7–9; Propositions 14–19, pp.28–29 |
| Edidin–Graham, math/9905081v2 | Conventions p.3; Theorem 3.1 and proof, pp.13–14 |
| Luo, math/9801025v1 | §1, main unnumbered theorem, p.2, with conventions and proof on pp.1–5 |
| Hall, 1101.5123v2 | Theorem 1, p.1; Appendix A, Theorem A.1 and Corollaries A.2–A.3, pp.17–18 |
| Frediani–Neumann, math/0404387v1 | Theorem 1.5, p.9; Theorem 2.5 and Proposition 2.6, p.11; §2.3, pp.17–19, including Proposition 2.14 proof |

- **E15 rejected.** Two genus-two stabilizer arrows above the same object pair
  refute monomorphism, not analytic immersion. The source projection is locally
  an isomorphism, so the arrow map is locally a graph and is an immersion in the
  differential sense. Retain the inertia warning, but do not accuse the source
  of an error based on the stronger embedding interpretation.
- **E16 confirmed.** The displayed fixed-source fibre contains a positive-dimensional
  Teichmüller factor, inconsistent with the local-isomorphism projection. G=1 and
  g=2 already exhibit the contradiction. The discrete source fibre and full arrow
  space have been confused; the intended argument survives.
- **E17 confirmed.** The action nerve has faces x and γx on an arrow, whereas a
  constant-space product retains x for both. Degreewise product spaces therefore
  do not give the asserted simplicial product. The Borel construction and
  contractible Teichmüller fibre give the intended homotopy equivalence.
- **E18 added and confirmed.** In the published Proposition 6.8 proof, p.317, the
  projection-formula display drops γ^{k₀} on its left while retaining it on the
  right. With f:P¹_k→Spec(k), E=O(1), r=1 and k₀=3, the printed left side has
  Euler characteristic 1, while the right side is zero: a line-minus-one has no
  third gamma term. The complete flag of a line is the identity, so no flag term
  conceals the difference. Restoring the gamma operation repairs the display.
  This does not disprove Proposition 6.8 or Corollary 6.9.

E15–E17 apply only to the inspected arXiv v1. The publisher still returns a
challenge page, so no published K-Theory comparison is claimed. E18 applies to
the inspected published JEP PDF. Author lists, article pages, arXiv histories and
correction searches are recorded with dates in the packet. Finding no correction
is not a claim of historical novelty. Moret-Bailly 1989 was not obtained or used
as a reading receipt. No source passages were placed in these deliverables.

## Baseline, ownership and closure

Confirmed all nine declarations at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, reading their complete statements:
`InvertibleSheaf`, `.trivial`, `.tensorProduct`, `.tensorTrivialRightIso`,
`LineBundleClass`, `.mk_eq_mk_iff`, `.mk_tensorProduct`,
`AlgebraicGeometry.Scheme.Modules.pullback` and `CategoryTheory.Functor.mapIso`.
Module paths and precise provisions are in `baseline.declarations`. The line-class
carrier has a commutative monoid, not the planned full Picard-group structure;
class equality supplies existence rather than a preferred comparison.

Read the reviewed parent StableReduction layer-2 library audit; it does not
supply the coherent-curve lane, and there is no separate MC.5 audit. Checked the
current upstream README and Suggested interfaces of StableReduction and
AlgebraicVectorBundles at `0d144d044dacebca17b654695b6f1ad58f159b27`.
AV-L0A/L0B/L0C already own the monoidal module-sheaf, finite-locally-free and
ordinary determinant APIs. StableReduction layer 2 retains its locally
Noetherian range. Current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`
and Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` searches found no existing
implementation of the missing generic pairing or determinant-of-cohomology
interface. Search absence is not a completeness theorem.

Read the exact SF.1/SF.2/SF.3/SF.5, LV.5 and NE.2 supplier statements. In
particular, NE.2 owns the associative-ring virtual determinant; the commutative
graded-line realization and sheaf descent are extensions, not a second virtual
determinant. LV.5's existing twist node does not yet prove generation. SF.5's
smooth-scheme GRR is not an arbitrary nodal stack GRR theorem. These distinctions
justify the retained requests rather than attributing unplanned results upstream.

The combined base/support graph is acyclic after applying all imported-target
overlays. Every new proof input ends at an existing node, an exact current-upstream
import, or one of GDET, GPAIR, NODAL-BC, CHOW-PIC, TOPOLOGY, DESCENT and DIVISORS.
The arbitrary-base pullback node precedes the imported semi-canonical convention,
so that convention is not used to prove itself. These obligations prevent proof
closure but do not invalidate the completed planning pass.

## Validation and routing

- Blueprint checker: zero errors and zero warnings.
- Suggested Lean: elaborated with the pinned shared build, exactly thirteen
  omitted-proof warnings and no errors or other diagnostics. Four theorem
  signatures and nine examples check existing carriers; no data definitions
  or geometric implementations are introduced.
- Combined 22-target DAG and every removed edge checked; source-issue/version
  schemas and all 33 test-kind records checked. Reader, packet and suggested
  interface agree. Whitespace, allowed-file and private-path checks pass.

For the orchestrator, retain the seven supplier obligations and route the generic
GDET/GPAIR contracts to the proposed SchemeAndStackFoundations Part II owner;
that proposal is not an existing stage. Route NODAL-BC as an extension of the
parent coherent-curve interface, CHOW-PIC to stack intersection theory, TOPOLOGY
to analytic stack comparison plus mapping-class generation, DESCENT to stack H⁰
and evaluation, and DIVISORS to stack Cartier/Weil theory. No upstream roadmap was
edited. Assembly must apply `removedPrerequisites` before the additional and
upstream edges. There is no unresolved contradiction or further change required
for this review job.
