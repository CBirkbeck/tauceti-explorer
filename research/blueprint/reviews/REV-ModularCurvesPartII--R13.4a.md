# Review: ModularCurvesPartII R13.4a (algebraic coarse construction before analytic comparison)

Job `REV-ModularCurvesPartII--R13.4a` (issue #9396), reviewing `BP-ModularCurvesPartII--R13.4a`
(PR #9446, written by session claude-5gXl06). Reviewer: Claude (Opus 5.5), session claude-Fph0CO,
2026-10-13. I did none of the work under review.

**Verdict: accepted, with corrections made in place.** Three statements were false and are
corrected. Several closure links pointed at suppliers that do not state what is used: they are
repaired, or turned into two precise requests to SchemeAndStackFoundations SF.1. The rest are
locator and wording fixes. Every node is now verified or corrected, every baseline citation is
confirmed, and no contradiction remains.

## What was checked

- **Sources.** I fetched all eight sources into scratch, and every SHA-256 matches the packet:
  - Česnavičius arXiv:1511.07475v2;
  - Česnavičius arXiv:1608.01249v2;
  - Conrad's two author PDFs;
  - Abramovich–Vistoli math/9908167v2;
  - Zywina arXiv:1508.07660;
  - the Gross–Zagier MPIM scan;
  - the BDMTV Annals PDF.

  I read every node's locator in the text layer: Česnavičius pp.1–3, 20, 23–25, 27–29, 37–41,
  60, 62–65; Česnavičius 2016 pp.1–7; Conrad 2007 pp.1, 31–37; Conrad 2005 pp.1, 5, 8; AV
  pp.4–5; Zywina pp.2, 14–18; GZ pp.226–227, 254–255; BDMTV pp.887–888, 926–930. I read the
  Stacks tags 035I, 035J, 035K, 035L, 03GP, 03GR, 0AXP, 03GV and 00R4 online. I also read the
  Tau Ceti ModularCurves README at TauCetiRoadmap 0d144d0 at every cited section; a Sonnet
  agent did the anchor and quotation pass and I checked its findings.
- **Baseline.** All 20 declarations were read at Mathlib 082e2d3 and Tau Ceti f790474: name,
  module, kind and signature. A Sonnet agent did the reading and I checked its report. All 20
  are confirmed. Three `provides` texts were made exact:
  - `CongruenceSubgroup.Gamma1` is a≡1, d≡1, c≡0;
  - `normalizationPullback` is the comparison morphism, an isomorphism for smooth base change
    by an instance tagged Stacks 03GV;
  - the Tau Ceti automorphism theorem concerns variable changes over a domain.
- **Closure.**
  - Every foreign prerequisite was matched against its supplier's statement (Sonnet agent; I
    read the quoted statements).
  - Request `neededBy` lists were reconciled both ways with the prerequisites, and match after
    the corrections.
  - A DFS over all packets' node prerequisites finds no cycle through this packet.
  - The stage-level loop R13.4a ↔ R14.1 is pre-existing (see the questions below).
- **Granularity.** Target level, the default (`detail.json` has no entry). Nodes are targets and
  key theorems with proof sketches; nothing needed splitting.
- **API, unit tests and planets.** All 9 definitions and constructions have their API outlines
  and at least three tests of distinct kinds. I checked the numerical tests by hand: indices,
  projective indices, cusp counts and widths, degrees 60/240, the Cartan cusp fields, and the
  pairing value in `twistedCurve_split`. The two planets ("Deligne–Rapoport level stack",
  "Cartan modular curves") are key objects, well inside the limit.
- **Library audit.** `data/library-coverage.json` records R13.4a as not built (AUDIT-10).
  Nothing here is in the libraries beyond the cited normalization and congruence-subgroup
  declarations. TauCetiRoadmap's current main plans none of these targets: ModularCurves stops
  at prime-level diamond quotients over ℤ[1/N] and excludes stacks and generalized elliptic
  curves.
- **`check_blueprint.py`** (with the pinned index): 0 errors, 0 warnings.
- **Suggested Lean file.** `lean-check` at Mathlib 082e2d3 elaborates it with no errors; the only
  warnings are the 14 for proofs left open.

## Corrections to statements (errors)

| Node | Problem | Correction |
|---|---|---|
| `level-stack-geometry` (c) | Claimed the quotient stack [X(n)/H̄] over ℤ[1/n] is 𝒳_H[1/n]. False at the cusps. A rotation of the n-gon acts on E^sm[n]=μ_n×ℤ/n by a unipotent [[1,k],[0,1]] and contracts to the identity of the 1-gon. So [X(n)/H̄] is not representable over X(1) whenever H̄ meets such elements: at the cusp ∞ of X(p), Γ₀(p) does, and for H=GL₂(Ẑ) the quotient is Ell_n, not X(1). | (c) now states smoothness of 𝒳_H over ℤ[1/n] and the quotient description on the elliptic open only. The proof uses the frame torsor and the invariants of Conrad's full-level cusp charts (proof of Theorem 4.1.1, p.34; (4.2.1), p.37). It adds `level-h-structures` and `R13.3/formal-level-cusp-charts` as prerequisites. |
| `proper-rigidifying-covers` (a), (b) | Took p:P_H→𝒳_H to be a GL₂(ℤ/m)-torsor over ℤ[1/m], from the false (c). It is ramified along the cusps, with index m in the q-charts. The Hochschild–Serre argument for higher cohomology therefore fails. | (a) now gives the GL₂(ℤ/m)-invariant description for locally free F, by normality of 𝒳_H and generic Galois-ness of p. The equaliser still covers quasi-coherent F. (b) now uses the descent spectral sequence of the finite flat cover; the needed input is requested from SF.1. The unused `tame-finite-flat-descent` prerequisite was removed. |
| `coarse-level-quotients` | The first proof route used [𝒳_{H′}/(H/H′)]=𝒳_H, which fails for the same reason. | It keeps only the recognition route (Česnavičius Lemma 6.2), with `level-h-structures` and upstream 9A added. |

## Corrections to closure and proofs

- **`deligne-rapoport-level-stack`.** R09.5 `dm-normalization` is the absolute normalization of a
  DM stack, not normalization in a representable morphism. The proof now builds 𝒳_H as the
  relative spectrum of the quasi-coherent integral closure of 𝒪_{X(1)}. It is descended along
  an étale atlas using Mathlib's smooth-base-change isomorphism, with SF.1 `stack-quasi-coherent`
  and `affine-fpqc-descent` added.
- **`fibrewise-coarse-base-change`.** This general statement about flat DM stacks over ℤ took its
  local-structure input from the 𝒳_H-specific `coarse-local-structure`. Česnavičius's proof of
  Lemma 3.3.1 uses Abramovich–Vistoli 2.2.3. No SF.1 or R09.5 node states that, so the
  prerequisite is now the stage SF.1 with a request, and AV is added as a source.
- **`coarse-local-structure`.**
  - (d) spoke of the "ramification index" of X_H→ℙ¹_j at closed points of residue
    characteristic p, where the local rings are two-dimensional. It now states the local degree
    (degree of the extension of fraction fields of the strictly henselian local rings), which is
    the ramification index on the generic fibre. The acceptance criterion was changed to match.
  - Its local-structure input is the SF.1 request.
  - (e) cites SF.1 `tame-stack` for tameness of the invertible-order open and
    `compactified-coarse-j-line` for j=c₄³/Δ.
  - The Česnavičius locator moved to p.64, and the Conrad 2005 match now says that Theorem 4.2
    concerns étale representable maps.
- **`compactified-coarse-j-line`.**
  - Deligne's lemma now cites the Tau Ceti automorphism theorem.
  - The trivial inertia of C⫽{±1} now cites R09.5 `normal-inertia-subgroup` and
    `rigidification-stabilizers`.
  - The Ell_m step said the inertia over C is {±1}. The m-gons have μ_m×ℤ/2 there, so the step
    now uses tameness of the rigidification and AOV Corollary 3.3, as Česnavičius does (p.25),
    through SF.1 `tame-local-structure`.
- **`atkin-lehner-quotient-curves`.** The cited R14.1 `exact-divisor-atkin-lehner` gives w_N over ℚ
  only (and over ℤ[1/N] for prime N≥5), but the node quotients the integral curve. A first proof
  step now extends w_N to the normal ℤ-curve X₀(N):
  - Φ_N is monic in each variable and symmetric, so X₀(N) is the normalization of ℙ¹_ℤ via both
    j and j′.
  - The factor swap then extends w_N, by `finite-normal-recognition` and Stacks 035J.
- **`cartan-level-curves`.** X_s⁺(ℓ)≅X₀(ℓ²)/w_{ℓ²} was stated without a base, but
  `split-cartan-quotient` is over ℚ. The statement now gives ℚ from that node, and ℤ[1/ℓ] from
  the ordered identification, which carries the exchange of the two lines to w_{ℓ²} (checked
  on lattices).
- **`coarse-base-change-failure`.** The reason given for 2·α(1)=0 did not follow. The proof now
  follows Česnavičius 2016, Theorem 3.2:
  - the generator scheme of the Frobenius kernel G/G₂ is the zero section;
  - so α(1)∈G₂ and 2·α(1)=0.
- **`affine-open-identification`, `prime-diamond-agreement`.** These listed the first-pass node
  `coarse-normalization-comparisons` (R13.3 packet) as a prerequisite. That node states their own
  conclusions, and no proof step uses it, so it was removed. A `restructure` entry records the
  overlap for the next revision of the R13.3 packet.
- **`finite-normal-recognition`.**
  - The statement listed the D(t)⊂Spec k[t] base-change example as a third hypothesis on T; it is
    reworded as a base-change remark.
  - The match for Stacks 035L is corrected.
  - The unused SF.0 prerequisite is removed.
  - The Lean docstring is aligned with the new wording.
- **`fixed-pairing-coarse-curve`.** The API item `fixedPairingCurve.galois` now says the frame change
  is an R-isomorphism X(N,ζ)_R≅X(N,ζ^d)_R, which for R=ℤ[ζ_N] is an automorphism of X(N) over σ_d.

## Corrections to locators and paraphrases

- **Česnavičius 2016.** Theorem 2.1 and Remark 2.2 are on p.3, Lemmas 2.4–2.5 on p.4, Theorem 3.2
  on p.5, Theorem 4.2 on p.6 and Theorem 5.2 on p.7. They were cited one page early.
- **Zywina.** The Cartan subgroups are defined in the Notation paragraph of §1, p.2, not §1.2 (which
  is ℓ=3). Lemma 3.6 is in §3.3.
- **Conrad 2007.** The proof of Theorem 4.1.1(3) and the decomposition from KM 10.8.2 are on p.34;
  (4.2.1) is restated on p.37.
- **ModularCurves.** The §9B paraphrase in `level-subgroups` called every standard quotient group
  upper triangular, which is wrong. The `prime-diamond-agreement` locator is narrowed to Layer 10,
  items 1–2.
- **`readSections`** of three sources updated to match.

## Requests

There were 19 requests to Tau Ceti ModularCurves layers; I checked each against the README.
- **Need texts made exact:**
  - 0C (torsors);
  - 2B (no "universal isogeny" is there);
  - 9E (Y₀(N) only through M([Γ₀(N)])⊗ℤ[1/N]);
  - 2F (rigidity of naive structures over ℤ[1/N]).
- **9A request:** `coarse-level-quotients` was added to `neededBy`.
- **Two requests added to `SchemeAndStackFoundations:SF.1`:**
  - the étale-local structure of separated DM stacks over coarse spaces, with invariant
    strictly henselian and complete local rings (AV 2.2.3; Olsson 2006, 2.12);
  - quasi-coherent cohomology of stacks through the descent spectral sequence of a flat cover.

## Source issues

`ModularCurvesPartII/E401` (Gross–Zagier III §1, p.255) is **confirmed**. The stack there is the
naive stack of cyclic isogenies, and the strict-henselization step cites Deligne–Rapoport,
which treats squarefree level. For p²|N that stack is not Deligne–Mumford at cusps of
characteristic p.

I narrowed the correction, which claimed Česnavičius Theorem 6.7 recovers Proposition (1.4).
Theorem 6.7 removes the points with j=0 or 1728 in characteristics dividing N, so it does not.

I added to `searched` that the pathology itself is known (Edixhoven 1990; Conrad 2007 §1.1;
Česnavičius §1.2), and that Česnavičius §6 calls (1.4) an assertion. No new source issue was
found.

## Reader

The reader was regenerated from the corrected packet. The renderer was first validated to
reproduce the old reader byte for byte from the old packet. Hand-written prose is unchanged
except one sentence in "Existing work and boundaries", which names the two SF.1 requests.

## Counts

- Nodes: 23. Verified 6, corrected 17, added 0.
- Baseline: 20 confirmed, 0 removed.
- Requests: 19 → 21.
- Gaps: 0.
- `sourceIssues`: 1 confirmed.

## Questions for the orchestrator

1. **Ownership overlap with the first pass.** `R13.4a/coarse-normalization-comparisons` (R13.3
   packet) states the conclusions of `affine-open-identification` and `prime-diamond-agreement`.
   `R13.4a/integral-coarse-curves` takes its stack "supplied by R13.2", which covers only the
   standard levels, but its consumers use it for every open H. The `restructure` entry proposes
   that the next R13.3 revision cite this packet's nodes; that creates no cycle.
2. **R13.2 also asserts the normalization identifications.** `R13.2/agreement-with-katz-mazur-schemes`
   and `R13.2/refined-gamma-zero-moduli` already state them, while
   `standard-level-stack-identifications` proves them against 𝒳_H as defined here. Decide which
   layer owns the statement; the proof needs 𝒳_H, which lives here.
3. **Stage loop R13.4a ↔ R14.1.** `atkin-lehner-quotient-curves`, and the first-pass
   `split-cartan-quotient`, cite R14.1 `exact-divisor-atkin-lehner`, while R14.1 requires R13.4
   and hence R13.4a. There is no node-level cycle and the loop predates this packet (the R13.4
   packet records it), but the Atkin–Lehner involution may belong in an earlier layer.
4. **Requests to a partial packet.** Both new SF.1 requests go to the SF.1 packet, which is still
   partial.
