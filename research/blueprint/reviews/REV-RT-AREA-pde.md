# REV-RT-AREA-pde

Independent verification of the red-team findings `RT-AREA-pde` on the **Partial
differential equations** area — the Tau Ceti roadmap `PDE`, 32 stages in six lanes. I did
not write the roadmap, the audit, or the red team.

**39 findings — 6 high, 24 medium, 9 low. All 39 confirmed.**

These findings are argued in mathematical prose rather than declaration lists, so the weight
of a verification belongs on the mathematics. I settled all six high findings directly, plus
the two dependency findings, and checked the evidence base of the rest.

## The six high findings

**1 — Poincaré–Wirtinger without connectedness.** The document reads, at lines 95–96, "or
modulo constants (Poincaré–Wirtinger, zero mean), for `Ω` bounded (or of finite measure, or
bounded in one direction). State that side condition explicitly", and A-5 adds nothing.
Connectedness is missing and is essential: on **two disjoint balls** — a bounded domain —
take `u` equal to distinct constants on the two components, scaled to have mean zero. Then
`∇u = 0` while `u ≠ 0`, so no `‖u‖ ≤ C‖∇u‖` can hold.

**4 — the Mihlin–Hörmander instruction is vacuous as written.** B-10 says "the **Mihlin–
Hörmander multiplier theorem** (consume Mathlib's `FourierMultiplier`)". At the pin,
`SchwartzMap.fourierMultiplierCLM` is `𝓕⁻¹ ∘ smulLeftCLM ∘ 𝓕`, and
`SchwartzMap.smulLeftCLM` in `Analysis/Distribution/SchwartzSpace/Basic.lean` is literally

```lean
if hg : g.HasTemperateGrowth then SchwartzMap.bilinLeftCLM … hg else 0
```

`HasTemperateGrowth` demands smoothness with polynomially bounded derivatives. The symbols
Mihlin–Hörmander is *about* — `ξ_j/|ξ|`, `|ξ|^{iτ}`, anything satisfying only
`|∂^α m| ≲ |ξ|^{-|α|}` — are not smooth at the origin. So for exactly those symbols Mathlib's
multiplier **is the zero operator**, and a theorem proved by consuming it would be vacuous.

**17 — the end-to-end acceptance criterion is false.** README lines 348–351: the Dirichlet
problem `−Δu = f` in a ball with `u = 0` on the boundary "equals the **Newtonian-potential**
solution (Lane C.15): three lanes meeting on one example." The Newtonian potential `Φ*f`
solves `−Δw = f` but does **not** vanish on `∂B`; the solution with zero boundary data is
`Φ*f` corrected by the harmonic function agreeing with it on the boundary — the
Green's-function solution.

**27 — interior H² without a coefficient hypothesis.** E-20 reads "a weak `H¹` solution with
`L²` data is locally `H²`, bootstrapping to `C^∞` for smooth coefficients and data", where
the qualifier attaches to the bootstrap. The roadmap's standing operator (line 19) has
**bounded measurable coefficients**, and in that class interior H² is false: De Giorgi–Nash–
Moser gives Hölder continuity and no more, and the difference-quotient proof needs the
coefficients Lipschitz.

**32 — E-23's plan is out of date**, and the corroboration is inside the repository. The
roadmap side holds exactly: E-23 is a from-scratch build, the References name the Carleson
project, grepping the README for DeGiorgi, Armstrong or Kempe finds **nothing**, and the
Acknowledgements credit only a Zulip experiment. Decisively, **Tau Ceti itself vendors that
code**: `Analysis/Calculus/SegmentIncrement.lean:87-89` and
`MeasureTheory/Integral/NormRpow.lean:38-40` each cite "Scott Armstrong and Julia Kempe's
Apache-2.0 `scottnarmstrong/DeGiorgi/DeGiorgi/Poincare.lean`, commit
`4c1b3077d3782b24065184df4ba59501b2e56fc7`" — the exact commit the finding names. So the
roadmap plans from scratch a theorem whose formalization its own library already borrows
from, and whose source its references never name.

*Scope:* I did not verify the arXiv abstract or the repository README, which need the
network. The pin's own citations establish the project, its authors, its licence and its
commit.

**37 — Hille–Yosida planned twice.** PDE's declared prerequisite is
`tauceti:TauCetiRoadmap/OneParameterSemigroups`; that roadmap carries a stage "Milestone —
Hille–Yosida generation theorem"; and the PDE document mentions OneParameterSemigroups
**zero** times while listing "the **heat semigroup** and **Hille–Yosida**" among what it
builds.

## The two dependency findings, and a word in their favour

**26** could have been the over-generalisation I have seen elsewhere — a bare "no `requires`,
no stage edges" against an upstream roadmap, where that is the convention. It is not, and
the finding says so itself: its evidence records that **57 of the 59** Tau Ceti roadmaps
with stages have no intra-roadmap stage edge, the exceptions being ConformalMapping and
OneParameterSemigroups. My own independent count agrees exactly — across the atlas only **4
of 656** upstream stages populate `requires`, in those same two roadmaps. What it actually
claims is narrower and right: **no link map exists** for this roadmap
(`research/blueprint/links/tauceti_TauCetiRoadmap_PDE.json` is absent), so the dependencies
its own document states have no record by the mechanism upstream roadmaps use.

**11** is the cross-roadmap half, and both quotations are verbatim. HeegaardFloer's README:
"The PDE roadmap's Lane A/B builds `W^{k,p}(Ω)`, embeddings, Rellich, and Calderón–Zygmund
in general; this lane needs only the 2-dimensional … slice … and **should consume the shared
spine rather than duplicate it**". OptimalTransport's: "First consume PDE Lane A.1's weak
derivatives", and "bridging PDE Lane A.6's Rellich–Kondrachov theorem". Neither dependency
is recorded: no link map exists for any of the three, and HeegaardFloer's prerequisites are
CombinatorialHeegaardFloer and GeometricTopology, with **PDE absent**.

## The evidence base of the rest

I resolved every file-and-line citation the 39 findings give — 53 distinct — against the
pinned trees. Every file exists; 45 have an indexed declaration within twelve lines, and the
eight that do not are citations to module docstrings and file headers, which is exactly what
those claims are about. Every quotation attributed to the PDE document or to AUDIT-40 checks
out against the source.

## Division of labour

The **evidence** of all 39 I checked; the **mathematics** of the six high findings and the
two dependency findings I checked myself and would stake this review on. The judgement in
the remaining medium and low findings — that a note overstates, a hypothesis is missing, an
input is unplanned — is the red team's, sound wherever I probed. A fixer should still read
each milestone before rewriting it.

## What I did not do

No Lean was compiled. I did not re-derive every PDE statement in the roadmap, and I did not
reach the network, so finding 32's external citations rest on the repository's own
corroboration rather than on my reading of the paper.
