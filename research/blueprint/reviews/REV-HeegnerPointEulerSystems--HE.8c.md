# Independent review of the HE.8c source-hypothesis companion

**Verdict: accepted.** Job `REV-HeegnerPointEulerSystems--HE.8c`, issue #9390.
Codex (GPT-6), session `codex-Jb8mX3`, 14 October 2026. The original blueprint
was written by session `codex-Bft2B4` in PR #9564; this session did none of
that work. This is a completed review, not a checkpoint.

Acceptance concerns the source-hypothesis pass. AUDIT-25 classifies HE.8c
as process work: trace the Cornut assumptions, separate CV character/sign
and point/derivative hypotheses, and trace the BCGS conditional and
independent main-conjecture branches. H1, H2–H6 and H7–H9 respectively
cover those three audit targets. No arithmetic theorem is proved here.
The `complete` packet and `source_decomposed` coverage are appropriate;
no mathematical stage is declared closed.

## Inventory and corrections

| Item | Final count / result |
| --- | --- |
| Mathematical nodes, new API items, new unit tests, planets | 0 each; none added or removed |
| Baseline declarations | 0; no citation removed or replaced |
| Hypothesis records | 10: 7 verified, 3 corrected (H4, H6, H10) |
| Existing target imports | 23, all resolved in the accepted HE.7s packet |
| Referenced definition interfaces | 2 definitions, 8 API items, 6 unit tests; all retained with their HE.8 owner |
| Sources | 7 original hash-identified copies independently retrieved; 1 published dynamics copy added for targeted collation |
| Supplier requests / inherited gaps | 2 / 4; retained |
| Source issues | E1/E3 confirmed; E11/E12 added and confirmed |
| Suggested Lean file | 38 lines, only `Mathlib.Init` plus documentation; elaborates without errors or warnings |

The corrections made in place are:

1. **H4 quotient character.** Replace the unspecified matching type by
   ξ₀|G₂=ω_A^ε with A{ω_A}≠0 and the fixed reciprocity sign ε. Identify the
   point map α=q∘ι, where ι is the rational Hodge embedding. In the
   automorphic specialization ε=1, ω_A=ω and ξ₀=χ₀⁻¹ for H2's analytic
   torsion type. CV Theorem 4.2 and Remark 4.3, manuscript pp.37–38,
   justify the conversion. The reader now includes a C₃ eigenvalue check
   that detects character inversion, which a C₂ example cannot.
2. **H6 commensurability.** State the intended comparison between Γ and
   u⁻¹Γ′u. Add E11 and the published source receipt; no dynamical theorem
   or generic supplier proof is added.
3. **H10 class-field scope.** Correct the reader's attribution of all ring
   class fields to the named upstream API. Current ClassFieldTheory
   Layer 13 `ringClassField` carries the absolute-quadratic hypothesis.
   The general totally-real-F construction is the existing
   `HE.0/relative-cm-conductor-tower`, using the general global
   correspondence in Layer 12 and the specific relative-order idele
   quotient. It is not an application of that narrower named API.
4. **Version and review records.** Date the served CGS copy precisely as
   15 September 2023, retain its distinction from the 2025 publication,
   add `sourceVersions` and all four source-issue verdicts, and synchronize
   the reader and suggested-file documentation. No verbatim source
   passage or `excerpt` is introduced.

## Source and hypothesis checks

All seven original PDF hashes agree with the packet. The new published
receipt is the [EMS Press dynamics PDF](https://ems.press/content/serial-article-files/25969?nt=1),
SHA-256 `47ff862cffc6980c79a63ef041762397dcdf5b71155ce4d7d09d65e16507b109`.
Only its published p.290 (one-based PDF p.28) was collated for E11;
this does not certify a reading of the entire published article.
The following ledger gives the substantive checks; the full import map
and statements remain in the companion packet and reader.

| Record | Verdict | Source locator and independent check |
| --- | --- | --- |
| H1 | verified | Cornut introduction pp.1–3; §4 Theorem A pp.20–21. The trace is the finite torsion-group sum to the anticyclotomic tower, with a some-conductor conclusion. Ordinary reduction and odd-prime restrictions belong to the narrower application. The stronger modular-abelian-quotient statement is retained without broadening the imported HE.8 signature. |
| H2 | verified | CV §1.1 pp.3–6; Corollary 2.2 p.21; Lemma 2.8 p.23. Exact conductor is an 𝒪_F-order conductor; the tower rank is [F_P:ℚₚ]. Fixed torsion type, central compatibility, sufficiently large-level torsion embedding and exclusion of old characters are separate conditions. |
| H3 | verified | CV Lemma 1.1 / Definition 1.3 pp.5–6. S includes every real place; a possible extra P disappears only under the stated unramified/split/large-conductor alternatives. Automorphic exceptionality is a separate exclusion in the definite branch. |
| H4 | corrected | CV Definition 1.6 p.9; Theorems 1.10/1.13 pp.13,15; §4 pp.36–38; Theorem 5.10 and proof pp.58–60. Good endpoints, P-newness, nonzero quotient/vector, character type and nonexceptionality are retained. Made the quotient/projector/analytic-character conversion explicit. Tensoring the point group with a characteristic-zero field excludes nonzero torsion as a witness. |
| H5 | verified | CV Theorems 1.4–1.5 pp.6–7; Theorem 1.11 p.15. Positive-sign periods lead to values; the derivative assertion additionally needs ω=1 and N,D,P pairwise coprime. Both assertions choose some character at each sufficiently large level. The legacy HE.8c-prefixed identifier still has HE.8 mathematical ownership. |
| H6 | corrected | CV dynamics Theorem 2.9 / Corollary 2.10 pp.9–12 and §2.7 pp.31–34; CV Propositions 4.17 / 5.6 pp.49,55. The actual component fibres, probability measures, compact-open averages and P-irrational shifts remain. Added the corrected commensurability condition and its published collation. The general-F_P twisted-diagonal acquisition boundary remains explicit. |
| H7 | verified | BCGS Theorem A pp.2–3; coefficient conventions pp.6–10; Conjecture 1.2.10 p.14; full §2.1 proof pp.15–16. The actual Tate lattice and finite coefficient ideals remain. Rational lower divisibility suffices with a bounded p-error, using the common-rescaling bound uniform in its exponent. The conclusion permits κ₁=0 and requires neither analytic rank one nor integral equality. |
| H8 | verified | BCGS Theorem 1.2.13 pp.14–15; BCS Theorems 1.2.2 / 1.2.4 pp.2–3; CGS Theorem C and Greenberg reformulation pp.3–4. Rational irreducibility over G_ℚ, integral residual surjectivity, and the actual isogeny-kernel local exclusions are distinct branches. The single-power versus squared BDP functions are compared through matched ideals, coefficients, periods, Euler factors and Selmer conditions. This checks supplier interfaces, not their independent proofs. |
| H9 | verified | BCGS divisibility definitions and Theorem B / footnote 1 pp.2–3; §2.2 pp.17–20. Zero gives ∞, strata count exact prime support, and M∞ differs from M₀. The exact rational-prime Tamagawa sum needs p>3, surjectivity, integral equality and p-optimality over the entire ℚ-isogeny class. The sum over K-primes has twice the rational-prime multiplicity. |
| H10 | corrected | Read the existing HE.0 and HE.7s target/supplier statements and current upstream contracts. Corrected the absolute-quadratic versus relative CM class-field distinction. Independent geometry precedes analytic comparison; independent equalities precede late applications. No process theorem or new source-route owner is created. |

## Source issues

**E1, confirmed misprint.** In BCGS introduction p.1, both arXiv v2 and
the linked 2 January 2026 author copy introduce a positive absolute
D_K but use the negative exclusion in (disc). Positive D_K=3 passes
that literal test. The consistent signed condition is d_K≠−3.
The mathematical statements use that intended condition.

**E3, confirmed proof-range gap.** In those same two copies,
Theorem 2.2.2 / Proposition 2.2.1 / Lemma 2.2.4 and the intervening proof,
pp.17–19, have the inherited odd-prime versus p>3 mismatch. The uniform
stub lemma is used twice; the displayed proof does not separately dispose
of p=3. This is not a counterexample to the theorem at 3. Theorem B
already has the stronger bound. The arXiv history still lists v2 as latest,
and Castella's page links no correction for this paper. The linked CJM
DOI returned HTTP 403; no publisher wording is certified for E1/E3.

**E11, confirmed misprint, added.** Dynamics Definition 2.33, manuscript
p.33 and published p.290, conjugates Γ again instead of Γ′. At u=1 the
printed self-comparison is true regardless of the second subgroup. For
example, the identity subgroup and an infinite cyclic unipotent subgroup
of SL₂(ℚₚ) are not commensurable, nor does conjugation change the latter's
infinitude. The intended comparison uses Γ′, as the adjacent Corollary
2.34 proof does. The published page image confirms the missing prime.
The authors' pages, EMS article page and a title-and-erratum search
revealed no separate correction. The slip has no effect on the intended
argument; the corrected condition is used throughout this companion.

**E12, confirmed misprint, added.** CV Theorem 4.1, 1 April 2005 manuscript
p.37, writes Res(χ) in the compatibility hypothesis after fixing χ₀ and
before choosing χ in the conclusion. The equivalent Theorem 4.2 on the
same page explicitly gives χ₀|G₂=ω_A^ε. Supply the missing subscript.
The page image confirms this index slip. Authors' pages and a
title-and-erratum search revealed no separate correction. This finding
is scoped to the manuscript; the published chapter was not collated.

E11/E12 use the first unused numerical IDs after the existing HE.0
E1–E10 records. The inherited BCGS E1/E3 IDs are preserved rather than
renumbering another job's records.

## Ownership, closure, interfaces and red-team finding

All 23 imports resolve to the accepted HE.7s packet. Its mathematical
parents are HE.8/HE.8b, including the legacy CV derivative identifier.
No import is an assertion that its implementation exists. The two
referenced definitions' eight API names and six tests agree with the
owner packet, reader and suggested signatures. Membership/restriction,
old-character exclusion and transport are sufficient for the stratum's
uses; the identity-transition, wrong-type and C₂ tests detect the main
incorrect definitions. The profile's infimum, bottom, top and rescaling
interfaces retain coefficient-depth qualifications. Zero-system,
indices 3 versus 1, and indices 2 versus 5 distinguish zero conventions,
bottom versus eventual infimum, and minimum versus sum/maximum.
Their signatures are read as inherited prototypes, not newly certified
arithmetic constructions or new declarations in this companion.

The pinned Tau Ceti tree f790474 and Mathlib 082e2d3 were searched again
for Heegner, Kolyvagin, anticyclotomic, Cornut, Vatsal, Ratner and Tomanov.
The only Mathlib hit is unrelated Heegner-number commentary. The sole
actual import, `Mathlib.Init`, was read at the pin. Current Tau Ceti
(a91d3aa) and the current upstream roadmap tree (0d144d0) were inspected
read-only. Relevant GlobalNumberFields Layers 9/11, ClassFieldTheory
Layers 12/13, ProfiniteArithmetic Layers 0/1 and EllipticCurves Layers
2–4 contracts were checked. No library target is planned anew, and no
baseline assertion is silently broadened.

RT-AREA-iwasawa-1/1 is handled faithfully: the two HE.8 joint-CM targets
name the needed reductions, but GN.4's existing real Lie-group Ratner
statements do not supply products of cocompact SL₂(F_P) quotients. The
precise GN.4 extension request and the general-F_P acquisition gap stay.
The André–Oort alternative does not eliminate its own supplier obligation;
the split-p BDP route does not cover the inert-P scope.

Read the GN.4 real dynamics statements, GZ.8 generalized height identity,
HE.0 relative tower and BSD.7a CGS anticyclotomic supplier statement.
The companion preserves the height/BDP normalization and uniform-bound
boundaries, and requests the independent Eisenstein supplier without a
late HE.8b equality premise. Requests have mathematical HE.8/HE.8b
consumers, not HE.8c consumers. There is no new prerequisite graph to
close or new planet to name. The existing process-stage removal remains
an unapplied proposal, preserving the source matrix and legacy target.

## Validation and maintainer follow-up

`python3 scripts/check_blueprint.py` reports **0 errors, 0 warnings**.
`lean-check` on this session's final suggested file succeeds with **no
errors or warnings** at the shared pinned build. It validates only the
empty declaration set and its import, not the imported arithmetic plan.
The intake file check and source-issue schema check also pass.

No work remains in this review. The maintainer can preserve the matrix
under HE.8/HE.8b and remove HE.8c's process edges when applying its rescope
proposal. Mathematical supplier acquisition and the four inherited proof
boundaries remain the owners' work. The eventual full-roadmap package
must apply the current compact Suggested-file shape to the older owner's
prototypes; this review neither rewrites nor compiles that separate file.
