# Handoff: BP-PerfectoidShimuraVarieties

Claude (Claude Code, model Claude Opus 5.5) — session `claude-hkZHP3`, 2026-10-06. Refs #972.
Claim confirmed by the bot at [issue comment 6026222224](https://github.com/CBirkbeck/tauceti-explorer/issues/972#issuecomment-6026222224).
This run takes exactly one job and completes its target-level planning pass under PROTOCOL §0; it is not a checkpoint.

## Deliverables and coverage

The [packet](../packets/PerfectoidShimuraVarieties.json), [roadmap document](../readmes/PerfectoidShimuraVarieties.md) and [suggested Lean file](../suggested/PerfectoidShimuraVarieties.lean) agree; the document is generated from the packet, with an introduction and a prose overview of each layer. No other file is edited.

COUNTS

The plan starts from the leads of the extraction EXT-12 draft (41 nodes for S1–S4; S0, S5 and S6 were empty) and from the accepted restructuring RS-05 (P7 owns tilde-limits and the Frobenius tower criterion, P8 the finite quotients and closed-locus gluing, Q4 the closed perfectoid quotient, D6 diamondification). Every EXT-12 lead was checked against the source and either rewritten as a node, merged, or routed to its owner below.

Layer by layer:

- **S0** builds the tower, its right action (Milne's convention `T_{gh} = T_h ∘ T_g`), the diamond limit (through `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, Scholze ECD Lemma 11.22), perfectoid representatives in the sense of Scholze–Weinstein 2.4.1 (with P7's tilde-limits), the kernel of the action (the closure of the central rational elements with prime-to-p part in `K^p`; a tower is a `K_p`-torsor only when `Z(ℚ) ∩ K^pK_p = 1`), the component set, the neutral-component tower and rigidified moduli towers (used by S5's `G*`-tower, whose deck groups differ from those of the Shimura tower).
- **S0.general** gives the general-datum diamond and the toroidal tower diamond with fixed cone decomposition, refinement maps and Hecke translations on common refinements (the O8 request).
- **S1** plans Scholze's §§3.1–3.3 statement by statement (25 nodes), adds Heuer's description of the elliptic cusps at infinite level (closing the case `g = 1` that the codimension hypothesis of §2.3 excludes), Pilloni–Stroh's perfectoid toroidal Siegel tower, and the open Siegel tower with strict Iwahori level for O8.
- **S2** and **S4** plan Scholze §4.1 and Hansen–Johansson §§5.2–5.3 on top of P8's general results (P8 owns HJ §5.1: analytic separation, finite quotients, good towers, closed loci in towers).
- **S3** owns the Hodge-type period map on the tower (RT-AREA-padic-1/22) with the right-action convention `FL = P_μ\G`, Scholze's left-action `Fl` compared through `x ↦ x⁻¹`, the Levi-torsor pullback with the cyclotomic twist `M_HT = M_dR ×^{μ,ℤ_p^×} ℤ_p(1)` (missing from Boxer–Pilloni v1, present in their revised manuscript), the graph chart and frame asked for by O8, the elliptic and Hilbert cases and Pan's Hecke-equivariant sequence.
- **S5** compares the modular and the three Hilbert towers and plans every item O0/O4 asked for: the three towers and their maps, the `ℤ_p^×`-torsor span, the full profinite polarization torsor, the `𝒪_p^×`-valued Weil pairing with `(γ, x)^*w(e_β) = w(x⁻¹)w(det γ)w(e_β)`, and the common Hodge–Tate coordinate.
- **S6** owns Boxer–Pilloni Theorem 4.4.40 on the general toroidal tower (RT-AREA-padic-1/4), the abelian-type minimal period map (4.4.41–4.4.53), and the integral and Bruhat reductions of §4.6 asked for by O8 (with the `m = n` pushout of the revised manuscript).

## Red-team findings handed to this job

- RT-AREA-padic-1/22: S3 is planned as the single owner of the Hodge-type period map on the tower; the packet's first `restructure` entry proposes the owners entries and the narrowing of T2.
- RT-AREA-padic-1/4: S6 is planned as the single owner of the general toroidal `π^tor_HT` and Levi-torsor pullback; T6:comparison is narrowed (in the request to it and in the same `restructure` entry) to the finite-level logarithmic content.
- RT-AREA-padic-1/1: the perfectoidization of integral algebras (Bhatt–Scholze 10.11) is recorded as a gap with its consumers, and the second `restructure` entry proposes the edges from the pending PerfectoidQuotients Part II stage.

## Gaps

GAPS

## Requests

The requests go to roadmaps that have no packet (HodgeTateAndCanonicalSubgroups, HilbertModularVarietiesAndShimuraCurves, TorsionCohomologyInfrastructure) or whose packets do not yet contain the needed node (ShimuraCompactifications C2.general, C3, C3.general, C5; ShimuraVarieties V2, V8; ShimuraData D4). Each states the exact statement needed and the consuming nodes.

## Mistakes found in the sources

SOURCEISSUES

## Validation

VALIDATION

## Sources read and missing

SOURCES

## Where to resume

The packet is complete at target level; the next step is its independent review. A reviewer should check first: (1) the conventions of S0 and S3 (right actions, `x ↦ x⁻¹`, the cyclotomic twist) against Milne §5, Caraiani–Scholze §2.1 and Boxer–Pilloni §4.4; (2) the S1 chain against Scholze §3.2.5, especially the recorded gap at Lemma 3.2.35 and the issues E7–E11; (3) the Hilbert Weil-pairing and polarization statements of S5 against Birkbeck–Heuer–Williams §8 and the issues E26–E31. Two consumer corrections follow from this work and belong to other jobs: `OverconvergentAutomorphicForms:O4/arithmetic-representatives` (and its test `presentation-arithmetic-full`) copies Birkbeck–Heuer–Williams' `Z_∞ = closure of (1 + N𝒪_F)^{×,+}`, which should be the closure of `(1 + N𝒪_F)^×` (PerfectoidShimuraVarieties/E29); and HodgeTateAndCanonicalSubgroups T3/T4 should cite the S1 Frobenius-lift nodes rather than plan them again (third `restructure` entry).
