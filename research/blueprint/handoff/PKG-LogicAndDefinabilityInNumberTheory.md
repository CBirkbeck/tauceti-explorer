# PKG-LogicAndDefinabilityInNumberTheory

Issue: #10772. Worker: Codex (GPT-6), session `codex-GpoEtS`.
The claim bot confirmed this session's claim. This run takes no second job.

## Deliverable

Complete roadmap package for independent review, based on the accepted
`research/blueprint/packets/LogicAndDefinabilityInNumberTheory.json` and its reader
and suggested-file companions. No packet or other roadmap was edited.

The README opens with the summary, ownership boundaries, conventions and exact
supplier contracts. Seven ordered layers contain all 127 targets, including
their hypotheses, proof outlines, locators, prerequisites, APIs and checks.
The repeated general parameter convention is stated once; repeated acceptance
sentences are consolidated with their identical checks. No mathematical
condition is discarded by that consolidation.

| Layer | README sections | Targets | API entries | Checks | Definitions/constructions |
| --- | --- | ---: | ---: | ---: | ---: |
| LD.0 | 0.1–0.8 | 8 | 16 | 16 | 4 |
| LD.1 | 1.1–1.20 | 20 | 32 | 31 | 8 |
| LD.2 | 2.1–2.12 | 12 | 12 | 12 | 3 |
| LD.3 | 3.1–3.11 | 11 | 24 | 24 | 6 |
| LD.4 | 4.1–4.33 | 33 | 43 | 34 | 10 |
| LD.5 | 5.1–5.5 | 5 | 4 | 4 | 1 |
| LD.6 | 6.1–6.38 | 38 | 34 | 33 | 9 |
| Total | | 127 | 165 | 154 | 41 |

All 17 definitions and 24 constructions retain at least three prose checks.
Each target has a stable HTML anchor derived from its original LD identifier;
the local dependency links use the new subsection numbers. Layer 4 puts the
polynomial bridge and finite witnesses before effective coding. The analytic
countable-union lemma is in the Layer 6 general prefix, before the application
suffix. The sector decay lemma precedes the repaired curve test.

Suggested.lean has three real-bodied light definitions, ten theorem signatures
proved by `sorry`, and six proved examples, two per definition. It imports only
Mathlib. Heavy carriers and their full interfaces remain in the README and are
listed in the closing comment. No auxiliary lemma development, sorry'd data,
new library project or external implementation is included. The polynomial
design credits Cameron Freer and Mathlib PR #42203.

## Current upstream and library audit

Read the binding worker/protocol/upstream/package-shape instructions. Read the
current RealAlgebraicGeometry and Completed/EffectiveBounds READMEs and
Suggested files in full, and the current DifferentialGeometry corner/boundary
sections. Searched mathematical objects and hypotheses across all nine newer
roadmaps, Completed roadmaps and current Tau Ceti, rather than only declaration
names. The read-only upstream revisions were:

- TauCetiRoadmap: `0d144d044dacebca17b654695b6f1ad58f159b27`.
- Current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
- Compilation pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and
  Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Ownership exclusions and retained additions:

- RealAlgebraicGeometry Layers 3–6 already own semialgebraic syntax, CAD,
  projection closure, real closed field elimination and the algebraic
  o-minimal reduct. The selected-expansions target here adds only the analytic
  and exponential cases. Current Tau Ceti's semialgebraic formula/QE adapters
  still take projection closure as a hypothesis; their existence is not a
  proof of that missing hypothesis.
- DifferentialGeometry's “Boundary and corners” and Layer 5.5 own the abstract
  local-face boundary and immersion. Section 6.7 adds only analytic and finite
  definability certificates. It keeps dimension n−1 for n>0 and k local faces
  over a depth-k point.
- `TauCeti/RingTheory/Valuation/Coarsen.lean` already has
  `TauCeti.coarsenMapOfValueGroup` and `Valuation.coarsenByUnits`. Section 1.15
  adds only the Dittmann–Pop cut, convex-subgroup identification and valuation
  ring localization comparison.
- `TauCeti/RingTheory/GrothendieckRing.lean` already has
  `Algebra.GrothendieckAddGroup.instCommRing`, `ofRingHom` and `liftRingHom`.
  Section 3.2 adds only the definable scissor semiring and its maps.
- ArcTopologyAndDescent AT.0/AT.3 geometric ultraproduct and Boolean-sheaf
  constructions stay with that owner; they are not prerequisites of the
  arithmetic ultrapower.

Read the 60 baseline declaration statements at the pins, including the native
`Poly`, `Dioph`, existential-formula fragment, ultraproduct, standard-part,
valuation-group and height conventions. Checked the reviewed library-coverage
file: it has no direct LD layer audit; the incidental DT.5/ES.5 references do
not establish the geometric Ax suppliers needed here. No LD-specific link map
exists. The exact dependencies come from the accepted targets and supplier
requests. No `FoundationsAndLibraryIntegration` or invented `UPSTREAM:`
dependency was introduced.

## Precision corrections for the plan maintainer

The packet remains unchanged. The package makes these points precise:

1. Sections 1.8–1.9 use `dim_Kr(Kv)+1=dim_Kr(K)`. Truncated natural subtraction
   alone admits the trivial valuation of a finite field. The divisorial
   criterion must not use that weaker formula.
2. Relative forms use base-first order consistently. For a=xy and
   ω=dx∧dy, the form satisfying da∧φ=ω is φ=−dx/x. Its absolute density is
   still |dx/x|. The tensor equation in section 2.12 is base-first as well.
3. The residue Grothendieck direct image API in section 3.2 is restricted to a
   residue-sort object S→T in RDef_T. For arbitrary definable S→T, composition
   need not land in RDef_T. CL §5.1.2, pp.27–28, makes this restriction;
   general VF/VG pushforward belongs to the later integration theorem.
   Direct image remains additive, with the projection formula, rather than
   multiplicative. The two-point counterexample is retained.
4. The analytic zero-locus proof explicitly chooses a power-series equation
   not identically zero on the chart ball in question. Being nonzero somewhere
   on a disconnected analytic domain would not suffice for nullity.
5. Dyadic rational guards consistently use k+8ℤ_(2). The normalized residue
   fibre in the Weil-volume proof uses coordinates in (πO_F)^d.
6. The sum formula in section 4.21 explicitly assumes at least one of
   a,b,c,d is positive: the two real ramification supports must not intersect.
   It does not require both T sets separately to have no real restriction.
   This is the case needed by the R³/R⁵/R⁷ definitions and agrees with
   Koenigsmann Remark 8(a), p.80.

All 27 accepted source corrections remain mathematically represented. They
include Koenigsmann's quaternion entries, dyadic triple, nonsquare sign,
empty-support guards and class-one S_p; the higher-rank valuation flag and
nonzero torus coordinates; the BKT erratum and corrected rough localization;
choice/right-inverse and boundary conventions; the polynomial coefficient
count; additive motivic pushforward; quotient-map direction and gauge tensor
degree; characteristic-zero motivic base; quantifier-block versus total degree;
height totalization; full higher chain rule; correct fibre dimension; generator
and inverse norm bounds; positive pairing offset; and closed-embedding descent.

## Source checks

Downloaded 19 public PDFs into disposable scratch and compared SHA-256 values
with the accepted versions: all 19 matched. They were CL 2008 and transfer,
Dittmann–Pop, Koenigsmann, Davis, Colliot-Thélène–Van Geel, BKT and its erratum,
both GWZ papers, van den Dries–Miller, Pila–Wilkie, Pila 2009,
Habegger–Pila, Tsimerman, Gao–Habegger, MPT, Pila–Tsimerman 2014 and the
Cluckers addenda. Bibliographic identities for the other sources are retained
from the accepted source list; this run does not claim to have reread every
original proof cited through those sources.

Spot-checked more than fifteen distinct locators and their hypotheses:

- Koenigsmann Theorem 1/Corollary 2, pp.73–74; Lemma 17, p.85;
  Proposition 18 and Definition 19, p.86.
- Dittmann–Pop Proposition 3.2(3), p.7, and the opening field conventions.
- GWZ §2.1, p.5; Propositions 2.1–2.2, p.6; relative forms and Example 2.4,
  pp.6–7.
- CL Theorem 2.1.1, p.9; §5.1.2, pp.27–28; Theorem 10.1.1, pp.59–60.
- CL transfer Theorems 9.1.5 and 9.2.4, pp.43 and 46.
- Davis pairing/sequence coding, pp.236–238; minimization, p.260;
  Theorem 8.1, p.264. The positive pairing convention is corrected explicitly.
- CTV Theorem 4.3, pp.16–17; its zero-cycle supplier is not declared verified.
- BKT Appendix A.1–A.2, pp.19–20; corrected Theorems 1.1–1.2 in its
  2023 erratum, pp.1–3.
- van den Dries–Miller §4.5 and §4.10, p.13.
- Pila–Wilkie Theorems 1.8–1.9, pp.595–596.
- Habegger–Pila Corollary 7.2 and its proof, pp.23–25: the marked second
  projection survives, not necessarily the full original endpoint.
- MPT Theorems 2.1–2.2 and Corollary 2.3, p.5.
- Pila–Tsimerman Lemma 7.7, p.678.
- Masser–Zannier's CM-pair argument, p.648, and its block-counting use,
  pp.649–650.
- Lawrence–Sawin §6.1, Lemma 6.3 and its codimension argument, pp.64–65;
  Bakker–Tsimerman Theorem 1.1 and the variation/monodromy setup, pp.1–2.
- Howe–Klevdal Theorem 1.2.3, p.8: this is the recalled classical hyperbolic
  theorem, rather than their local p-adic theorem.
- Gao Theorem 13.3, p.48, and Remark 13.5/Theorem 13.6, pp.49–50:
  the mixed conclusion consumes a pure orbit bound. The v6 PDF has 54 pages;
  the bibliography corrects the accepted list's extent and pins that URL.

Read the cleared-source index; no book file was needed. In particular, no copy
of the uncleared Tame Topology book was used. No source passage was added to
the repository. No suspicious fetched instruction affected this work.

## Requirements deliberately remaining explicit

This is a completed package of an accepted target-level plan, not a claim that
its mathematical development or source decomposition is complete. The 21
accepted gaps remain visible as proof or supplier requirements:

| Requirement | Package location |
| --- | --- |
| Same-ultrafilter arithmetic/hyperreal adapter | 0.8 |
| Arbitrary-rank henselization construction | 1.11 |
| Simple-reduction primitive generator | 1.13 |
| Current coarsening and patch adapters | 1.12, 1.15 |
| Original Pas preparation and relative elimination proof | 1.3, 2.2 |
| Uniform integrability locus and Presburger summation | 2.4, 3.4 |
| Full motivic pushforward proof and global descent | 3.1, 3.7 |
| Davis/native partial computation and effective bounded universals | 4.11–4.16 |
| Normic-bundle zero-cycle/Brauer calculation | 4.30, supplier contract |
| Existential preservation and monic-root/MRDP adapter | 4.31–4.32 |
| Original analytic/exponential o-minimality and analytic cells | 6.3, 6.20 |
| General cell/dimension/choice/triangulation proofs | 6.4–6.5 |
| Exact definably proper quotient theorem | 6.9 |
| All-width rough curve induction and Hodge compatibility | 6.13–6.15 |
| Complex analytic closure and projective Chow suppliers | 6.17–6.18 |
| Original quantitative determinant estimate | 6.24 |
| Marked-endpoint strengthening or repaired abelian application | 6.29, 6.36 |
| Exact Part II and independent arithmetic/geometric contracts | supplier section, 6.30–6.38 |
| Modular-product/special-curve comparison | 6.34 |
| Current upstream imports and registry synchronization | ownership section, audit above |
| Nonarchimedean analytic substitution, nullity and measure gluing | 2.4–2.12 |

The upstream ownership comparison resolves what to import, but this job cannot
edit registry or packet dependencies. The current ShimuraVarietiesPartII
packet concerns integral models and does not expose the requested mixed
Shimura theorem. LogicAndDefinabilityPartII and the relevant period-map
continuation still need exact supplier identifiers. The package therefore
states the full mathematical contracts instead of inventing node IDs or
claiming that those continuation names already discharge them. The order must
be the general LD.6 prefix → independent suppliers → application suffix;
neither supplier may depend on the entire LD.6 or its suffix.

## Validation

- `lean-check research/blueprint/packages/LogicAndDefinabilityInNumberTheory/Suggested.lean`:
  exit 0, ten expected `declaration uses sorry` warnings, no other warning or
  error. Memory was checked before compiling. No Lake build/update/cache or
  language server was started. The initial failed example elaborations were
  corrected; the final signatures and all six examples elaborate.
- `python3 scripts/check_blueprint.py research/blueprint/packets/LogicAndDefinabilityInNumberTheory.json`:
  0 errors, 0 warnings; all 127 targets retained.
- Mechanical package inventory: 127 unique targets/anchors, 165 API names,
  154 check names, all 41 definition/construction check counts at least three;
  internal target prerequisites precede their users.
- All ten Lean signatures compared with their README contracts, including
  arbitrary input universe/finite witnesses, native REPred, rational
  quantifier order, conditional integer transfer and the prime finite-field
  count. Every mathematical target received an adversarial hypothesis and
  degenerate-case pass; the corrections above record the additional issues.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  4 files, 0 problems. Final whitespace/path checks passed as well.

No package implementation remains for a successor. The independent reviewer
should concentrate on the precision corrections and the explicit inherited
proof/supplier requirements rather than interpreting the Lean placeholders as
formalized mathematics.
