# BP-DirichletPadicLFunctions — classical Eisenstein comparison

Codex — codex-7e92bd, 27 September 2026. Refs #713. Winning claim comment
5852574936 was confirmed by bot5852575669; the full issue was read before and
after confirmation. This is a partial checkpoint.

## What changed

Eight new L4 nodes give the arithmetic scalar normalization of the pinned
constant-one Eisenstein form, its coefficient and zeta-constant formulas,
the actual p-stabilized form at Γ₀(p), the full q-expansion comparison,
positive divisor coefficients, the stabilized constant and the comparison
with native positive coefficient measures through a common integer.

The two constructors use the existing ModularForm carrier. Restrict to
Γ₀(1) before the existing levelRaise, and to Γ₀(p) for the first term.
The native subgroup conjugation lemma supplies the level change; its
normalized evaluation is f(pz). All coefficient formulas use period1.
The two constructors and degeneracy identity make sense for k≥4; the
arithmetic formulas require k even. All prime statements include p=2.

The full q-series is Q_k−p^(k−1)Q_k(q^p), including degree0. The common
integer at n>0 is Σ_{d∣n,p∤d}d^(k−1), with separate images in ℂ and ℤ_p.
At n=p this is1. At p=2,k=4 the constant is −7/240, which is not an
integral dyadic coefficient. No A₀ or arbitrary ℂ-to-C_p map is supplied.

All 58 predecessor mathematical statements and hypotheses survive exactly;
57 node objects are unchanged. One inherited moment proof-status sentence
now points to the new comparison instead of calling it a remaining gap.
All9 source findings, source-version records, the preceding71 baseline
records, requests and executable suggested declarations survive. The
suggested file changes one stale explanatory comment and appends the new
native signatures. No independent-review verdict is added.

Totals: **66 nodes** (1 definition,7 constructions,37 lemmas,18 theorems,
3 comparisons), **62 API entries**, **46 definition/construction tests plus
one other test**, **50 typed examples**, **12 planets** (6 L1,6 L4), and
**86 baseline references**. Five gaps and no requests remain. L0,L1,L4 are
partial; L2,L3 retain their extraction status; no stage is closed.

## Evidence and checks

Freshly downloaded and read the published §8 at PDF59–62 / printed158–161,
and collated arXiv v2 PDF43–45. Published SHA-256:
`78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6`;
v2 SHA-256:
`efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4`.
The new proof outlines are explicit specializations of the pinned native
modular-form APIs. All fifteen added baseline statements were read at the
pins. Bernoulli nonvanishing is a short internal consequence of existing
positive-even zeta values and nonvanishing in Re(s)>1, not a new owner.

The five AUDIT-24 rows, campaign L0–L4 and accepted RS-14 contracts were
checked. The classical ModularForms Layer0 was read for its ownership of
nebentypus, generalized Bernoulli quantities and exceptional weights.
Two upstream models, protocols and touching links match previously read
session snapshots. The current PMIA117-node and Coleman69-node suppliers
and relevant source-register changes were inspected in this continuous
worker session; previous source-reading provenance remains explicitly
historical. No complete-paper extraction or new source finding is claimed.

The actual suggested file **compiles with zero errors and124 warnings,
all `sorry` placeholders**. Its real PMIA supplier compiles with255 such
warnings. Recursive actual imports reach **3,541 Mathlib sources**, byte
checked against the pin/cache, and **19 Tau Ceti modules**, all freshly
rebuilt from the pin without warnings. No substitute measure or modular
carrier is used. These checks do not establish the planned proofs.

Six complete scratch Lean proofs compile without warnings: subgroup
inclusion, period1, full stabilization q-expansion, the even Bernoulli
nonvanishing specialization, normalized coefficients and the zeta
constant. Both modular constructors elaborate. The scratch imports also
have a pinned-source audit (3,209 Mathlib and19 Tau Ceti modules).
**8,267 exact arithmetic assertions** pass, covering2,520 positive
coefficients for p=2,3,5,7,11, even weights4–14 and indices1–84. Independent
unit-divisor sums are compared with sparse q-to-q^p expansion of the
rationally normalized coefficient series. Named controls detect the wrong
weight exponent, unchanged constant-one normalization, constant sign,
false integral dyadic constant and false vanishing of the coefficient at p.

Indexed blueprint validation: **zero errors and warnings** with the unmodified
pinned index. Four-file intake: **zero problems**. The errata wrapper passes;
statement/hypothesis preservation, reader/API/test agreement, source hashes and
scoped mutations pass. The142-node reachable dependency graph has556 edges,
is acyclic and has only baseline leaves. The new work uses no stage request.

Final publication guard: all 51 captured inputs and all four predecessor
outputs match main `96c6e79eae6728d86946aec13032d536b15d5a08`. The issue body and
winning claim are unchanged. Exactly four authorized files are submitted
through Git Data REST.

## Where to resume

1. The most direct L4 continuation is now the intrinsic-unit-measure to
   completed-group-algebra comparison, followed by A₀=xζ_p/2. Inspect the
   current PadicMeasuresIwasawaAlgebras:L1/L3 packets for exact supplier
   nodes before requesting anything. The ambient integral A_n and its
   actual classical modular coefficient comparison are already planned.
2. A₀ still needs the **arithmetic** L1 ζ_p in the actual localization:
   compare the existing ambient smoothing/cross-smoothing/parity identities
   through intrinsic unit support and multiplicative Dirac/convolution;
   prove regularity of θ_a=[a]−[1]; instantiate the common localization,
   admissible character evaluation and denominator independence. Include
   k=1, parity descent and the separate integral dyadic branch. Neither a
   rational constant formula nor division in ℚ_p supplies this object.
3. Once that exists, assemble all coefficients at x^(k−1), with exact
   denominator conditions, and decompose the tame-character extension and
   constant-term congruences. Existing ModularForms owns the classical
   character Eisenstein series and generalized Bernoulli/Gauss machinery;
   PadicFamilies owns geometric affinoid realization and Hida–Coleman
   control. Do not replan those carriers here.
4. L0 Mellin/decay and algebraic-value comparisons, L2 p-power/tame twists,
   coefficient descent, L3 branch/logarithm/pole calculations and arithmetic
   coefficient extension remain as recorded in their unchanged gaps.

The predecessor root-average requests are already resolved to exact PMIA
nodes. Do not reintroduce them or act with bounded ψ on1/T. The retained
E9 correction requires the weight-space point κ_(k−1), with even k≥4.

Publication is restricted to this handoff, packet, reader and suggested
file. No scratch proof, downloaded source, dependency or generic library
file is submitted; no git command is used.
