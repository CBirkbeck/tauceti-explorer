# BP-EllipticRegulators--ER.8 handoff

Issue #6489. Agent Codex, session `codex-FK9WoX`.
This is a completed planning pass under PROTOCOL §0, submitted for independent
review. The packet status is `complete`; the sole stage
`EllipticRegulators:ER.8` is **planned**, with explicit remaining contracts,
and is not closed. No declaration is claimed to be implemented.

## Delivered

The four deliverables are the part packet, reader, suggested Lean file and this
note. The accepted parent is imported without modification. New ids do not
duplicate its six ER.8 nodes. General K-theory, Coleman integration, refined
distributions, CM theory and geometric regulators stay with their owners.

- **12 nodes:** two definitions, one construction, three theorems, one
  comparison and five applications.
- **17 API items** and **13 definition/construction tests**, distributed as
  6/4 for the Frobenius scalar, 4/4 for the rational-scalar relation and 7/5
  for the explicit quadratic symbol.
- **Four planets:** Syntomic regulator comparison, Frobenius regulator,
  Corrected torsion symbol, Transfer of a torsion symbol.
- **16 pinned baseline declarations**, three gaps and five supplier requests.
  All implementation statuses are `unchecked`; no restructuring is proposed.

The p-adic comparison specifies the good-reduction holomorphic Coleman pairing,
its constant-term and finite-extension conventions, and its limitation: that
pairing alone does not determine the whole de Rham vector. The elliptic
Frobenius comparison is stated over the linear Frobenius of an elliptic curve
over Q, with coefficient extension for its eigenvalue. It retains both factors
in the normalized scalar: the syntomic-to-étale pairing factor
`1-1/(p gamma)` and the separate eigenline factor `1-p/gamma`.

The Néron dictionary imports the actual owner distribution and its
non-theta-critical refinement. It pins primitive cycle periods, character
inversion and Gauss sign. The inverse-x moment at the Beilinson argument is
outside classical interpolation. The common rational-scalar predicate has an
actual existential definition with nonzero witnesses and regulator values;
its geometric application remains conjectural.

For the CM class on 36a1 the part gives the explicit sixth division polynomial,
its 35 simple finite zeros, pole order 35, and leading unit at infinity. A
fixed Miller chain and specified exceptional addition conventions provide the
full symbolic residue schema for the three ER.5 index points. There are 105
finite rows and three infinity rows over the full six-torsion splitting field,
not just the quadratic CM field. The corrected complex scalar is
`pi/(324 i)`. This is a complete symbolic schema; the matching algebraic
coordinate table still requires CM.1/CM.2.

The formerly unspecified quadratic class is now a concrete four-term symbol
on `y²=x³+1` at `T=(2zeta,3)`. The packet and reader give its functions,
principal divisors, local parameters, leading units, and tame cancellations
at T, A, B and infinity. Its rational transfer has a complete closed-point
certificate over Q. The quadratic residue is tested in its residue field
before a norm is taken. The rational transfer formula discards root-of-unity
3-torsion, and is not claimed as an equality of integral representatives.
The full complex regulator precedes its imaginary trace simplification.
Neither this horizontal certificate nor the CM certificate asserts global
arithmetic integrality. The parent 11a3 positive and u=1/3 negative vertical
tests, projective-line normalization and modular-unit examples are imported.

## Confirmed red-team findings

**RT-AREA-ktheory-2/10:** CM nodes directly import ER.5's U and corrected
L-value theorem. Arithmetic eligibility directly imports E.6's model, integral
part and vertical boundary nodes, with E.7/E.8 certificates. Promotion of those
prerequisites supplies ER.5 → ER.8 and E.6 → ER.8. The atlas data was not edited.

**RT-AREA-ktheory-2/11:** the syntomic pairing directly imports Coleman L1,
with an explicit elliptic request. The Néron dictionary directly imports
modular-symbol L2/L4, plus L1 periods and L3 critical-refinement nodes. It
constructs no new general p-adic L-function. The D.5 supplier request explicitly
requires D.5 to import Coleman L1 for its integration step. That supplier-side
change belongs to D.5's owner.

## Checks and Lean limitation

`python3 scripts/check_blueprint.py research/blueprint/packets/EllipticRegulators--ER.8.json`
reports **0 errors and 0 warnings**. The source-issue and source-version shared
validators, inventory/name consistency and prerequisite references were also
checked. Exact independent characteristic-zero polynomial arithmetic checked
the tangent/secant factorizations, six-torsion group arithmetic, norm functions,
finite and infinity tame cancellations, local leading coefficients, diamond
coefficients, division-polynomial recurrence and simple zeros, and the odd
quadratic Gauss sign. These checks validate computations and planning
signatures, not proofs of the geometric regulator theorems.

**The complete suggested Lean file was not compiled.** An attempted
`lean-check research/blueprint/suggested/EllipticRegulators--ER.8.lean` failed
before elaboration because the shared build lacks the object file for
`TauCeti.AlgebraicGeometry.EllipticCurve.Affine.FunctionField.GenericPoint`.
The shared Mathlib revision is the required
`082e2d37e8b0463410cdb532e111cd43d5a66174`; the shared Tau Ceti checkout is
`cf386627e9176a3827c1a5fe804989fd94a4d216`, rather than the required
`f790474821cf4256814db967cb154e7af3d0c369`. No library build or update was run.

A Mathlib-only extracted fragment containing the scalar, relation predicate,
their eight tests, and the six polynomial/Gauss statements **elaborated with
only planning-placeholder warnings** at the pinned Mathlib. Extraction removed
the two Tau Ceti imports, retained the scalar/relation sections, and added the
curve data and polynomial-check section. The geometric function-field,
principal-divisor and raw-symbol table sections were not elaborated. Their
actual Tau Ceti source interfaces were read at the pin; their elaboration
remains unverified. Memory was checked before compilation; all compile
processes finished. The real imports are retained in the suggested file.

Several geometric signatures cannot be expressed against the pinned library.
The suggested file names the actual missing owner maps and hypotheses in its
final comment, including the certificate API item. It uses no substitute
cohomology type or arbitrary proposition field. This limitation is the third
recorded gap and does not disappear when the algebraic fragment elaborates.

## Sources and corrections

Public source versions, exact sections read, URLs, access date 6 October 2026
and downloaded PDF hashes are recorded in the packet. New reading covers:

- Asakura–Chida arXiv:2003.08888v2, §§2.2–2.3, 3.3–3.4 and the §5.2 algorithm
  interface; the HUSCAP accepted manuscript's Theorems 2.2–2.3, §3.4 and
  footnote 10. The publisher preview confirms footnote 10; its body was not
  available. No claim is made to have read the full published article.
- Besser–de Jeu arXiv:1208.0516v1, introduction pp. 1–4, including constant-term
  divisor evaluation and the K2 restatement in Remark 1.10. Its K4 theory is
  outside this job. The original Besser II full proof was not obtained.
- Brunault 2010, introduction, §1, §3 Remark 3.1 and §9 including Remark 9.4,
  as a comparison source. Its measure convention is not silently identified
  with the owner distribution.
- The accepted parent packet, including the corrected ER.5 theorem and source
  issues E7–E9. Restricted Bloch-book assertions are inherited, not newly
  reverified. Pinned division-polynomial definitions and relevant Tau Ceti
  statements were read directly.

The upstream ContourIntegration and ArithmeticDirichletSeries documents were
read in full for style. The original roadmap, stage atlas, reviewed library
audit, relevant links, parent coverage and confirmed red-team findings were
read before planning. Other downloaded texts used as leads supply no new
unread assertion; scratch material is removed at submission.

**E28** is scoped to the 2020 v2 finite-coset formula: its missing
`alpha^(-nu)` is already corrected in the inspected accepted manuscript.
**E29** is scoped to the accepted manuscript's nontrivial-character
interpolation formula. The displayed mass convention gives
`gamma^(-nu) tau(chi) L(E,chi^(-1),1)/Omega^sign`; the printed expression
fails the odd quadratic character modulo three. Its Gauss sum squares to -3,
so `3/tau=-tau`, and character inversion cannot repair that test. The version
history, accepted text, publisher preview and Chida publication page were
inspected for corrections. No separate E29 correction was found there; the
unread version-of-record body is not accused of containing the same formula.
The independent review must check both findings at their versioned locators.

## Exact follow-up

The five supplier requests specify:

1. **PadicHodgeRegulators:D.5:** actual weight-two syntomic regulator,
   de Rham identification, cup/trace and Coleman formula; the full
   two-coordinate vector or reconstruction algorithm, the étale comparison,
   and the missing Coleman supplier edge.
2. **PadicHodgeRegulators:D.2:** actual local étale regulator and Bloch–Kato
   logarithm with matching target, normalization and base change.
3. **ColemanIntegration:L1:** elliptic constant-term, primitive-constant and
   finite-extension trace APIs; discharge or explicitly retain the supplier's
   general elliptic coordinate/Taylor hypothesis gap.
4. **ComplexMultiplicationAndExplicitReciprocity:CM.1:** oriented
   analytic/algebraic map and coordinates for the three index points and all
   six-torsion points over the full splitting field.
5. **ComplexMultiplicationAndExplicitReciprocity:CM.2:** twist-sensitive
   torsion-level Galois action, including conjugation, matched to ER.5's
   character and index set.

The remaining coverage consists of those contracts, an exact proof that the
three-point D-sum reduces to the parent's one-point numerical formula, and
replacement of the explicitly omitted geometric Lean signatures by actual
owner types. A follow-up should start with these contracts and the parent's
accepted nodes, preserve all normalizations and version distinctions, and
rerun the complete suggested file in a build containing the required pinned
Tau Ceti modules. It must separately obtain vertical certificates before
claiming global integrality of beta or U. The stage has no further unrecorded
target in this pass.
