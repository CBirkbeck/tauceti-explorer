# Independent review: DirichletPadicLFunctions L3, second pass

**Accepted after corrections**, 10 October 2026. Reviewer: Codex, session
`codex-QzD9iR`; job `REV-DirichletPadicLFunctions--L3-2`, issue #6297.
The original planning session was `codex-707vA6`; this review is independent.

The final packet has **79 nodes** (9 definitions, 66 lemmas, 4 theorems),
27 promoted API items, **32 definition tests**, 5 planets, **29 baseline
citations**, 8 requests and 5 gaps. Its per-node review records 25 verified and
54 corrected nodes, with none added or unverifiable. Most corrections are
locator corrections; the substantive changes are described below. No original
baseline citation was removed. The predecessor's 1,663 nodes were neither copied
nor edited.

`complete` means a finished planning pass. L3 remains `planned`, with no closed
stage. The recorded generic interfaces, arithmetic nonzero projection and
inherited Gross–Koblitz/Kubert frontier remain open. This acceptance does not
assert that the conditional prototypes prove the arithmetic theorems. The
current WORKERS.md and detail.json require target-level planning and override
the older issue's lemma-level setting; the existing useful API nodes were kept,
and smaller proof steps were not expanded into further nodes.

## Mathematical corrections

1. **Inverse unit weight.** In `rjw2-inverse-teichmuller`, the old proof reversed
   the tame measure identity. RJW Definition 5.13, p.146, gives
   `ζ_eta = x^(-1) Res_U μ_eta`, equivalently `x ζ_eta = Res_U μ_eta`.
   The corrected sketch now agrees with the statement's
   `χω^(-1) angle^(-s)` integrand and with RJW Remark 5.19, p.147.
   The inherited independently reviewed E14 correction to the proof of
   Theorem 5.20, p.148, is retained.
2. **Principal interpolation and actual conductors.** The old interpolation
   theorem excluded θ=1 although the principal zeta and dyadic branches used
   it. It now includes the conductor-one character. The conductor-one twisted
   case cites L1's positive Bernoulli moments; the primitive-only L2
   pseudomeasure theorem is used only in its stated range. The native
   `primitiveCharacter`, `changeLevel_primitiveCharacter` and
   `LFunction_changeLevel` declarations supply the conductor dictionary.
   The latter's restriction is satisfied because `s=1−k≠1` for `k≥1`.
   The finite-level Euler product restores the primitive inducer's value at p;
   it never substitutes the inflated character's zero there. Any chosen-root
   comparison needing a larger coefficient field is performed there and
   descended through the injective embedding.
3. **Normalized Gamma antidifference.** Added direct dependencies on inherited
   natural Gamma values and natural logarithmic sums, plus native density of
   natural casts. The suggested signature now includes `A(0)=0`, both
   recurrence branches, the strict natural sum and uniqueness among continuous
   normalized solutions. It takes the actual Gamma/log composition explicitly,
   rather than claiming continuity of an arbitrary scalar logarithm. The
   incorrect `E34` locator became `E37`.
4. **Differentiating a limit.** The old Lean probe assumed the final
   `HasFPowerSeriesAt` statement, leaving its coefficient bounds and limits
   unused. It now takes a positive radius, uniform geometric coefficient bound,
   coefficientwise convergence and identification of the pointwise series
   limit, and concludes both the native expansion and its first derivative.
   For the arithmetic application the series function is `−Lp(−s)`, whose
   first derivative is `Lp′(0)`. The requested factorial estimate, log-power
   antidifferences and coefficient-limit theorem remain explicit prerequisites.
   The proof sketch's dyadic log bound is 1/4, versus 1/p at odd primes; a
   sufficiently small radius gives a geometric majorant without any factor
   equal to the number of summands.
5. **Carry representative.** The character-sum calculation uses the flat
   representative of `−a/p` in `[0,N)`, consistently with Zhao Lemma 4.2,
   pp.472–473. This is now stated consistently in its sketch.
6. **A discriminating Gamma-sum test.** Added the level-five quartic-character
   polynomial test. Unlike the original empty/modulus-two/zero-log tests, it
   distinguishes χ from its inverse and detects an unwanted sign or `1/N`.
   The supplied logarithm in this finite adapter test is deliberately general;
   the test does not invent arithmetic Gamma-log values.

## Sources and erratum

Fresh downloads of all five public PDFs have exactly the SHA-256 hashes in the
packet. The relevant text was checked at the following locators:

| Source | Independently checked material |
|---|---|
| [Rodrigues Jacinto–Williams](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf) | Definition 5.13 and §5.3, pp.146–148; all of §§6–7, pp.148–158, including Theorem 6.1 and Theorem 7.1 |
| [Gross–Koblitz](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf) | Scanned pp.569–571: signed Gamma, negative Gauss sums (1.2), root compatibility (1.5), Theorem 1.7 |
| [Morita](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf) | Scanned §1, pp.255–256: unsigned natural product versus signed continuous extension, both recurrences and dyadic qualifications |
| [Gross–Dasgupta](https://services.math.duke.edu/~dasgupta/papers/Gross.pdf) | §2, pp.4–5: exceptional derivative, orbit products, Jacobi/Gauss logarithms and the cited Brumer input |
| [Zhao, published](https://doi.org/10.1017/S0013091522000177) | §3, pp.467–469; §4, pp.470–473; Appendices A–B, pp.473–474; notation in §1.2, p.461 |

RJW's bibliographic range was corrected to **101–216**. The common §5.3 locator
now starts at p.146. The special-value locators now distinguish Remark 6.3,
Lemmas 6.4–6.5 and Remark 6.6; the independent smoothed primitive is in **§7,
Lemmas 7.3–7.5, pp.156–158**, not a nonexistent §6.3.

**E37 is independently confirmed.** Published Example B.2, p.474, and
[arXiv v1](https://arxiv.org/pdf/2201.08870v1) have the same inconsistent inclusive
endpoint and shifted Gamma argument. The normalized recurrence instead gives
the strict sum and `log_p Γ_p(x)`. At `p=5,x=2`, the normalized value is zero,
whereas the shifted expression is `log_5(2)≠0`: multiplying it by four gives
`log_5(1+15)`, whose first term has strictly dominant valuation one.
The downloaded v1 hash is
`33e622dacde7cf7e9589961af3affeecc75605804fa7ecd9cc0ef6eb802240ed`, matching
sourceVersions. The publisher/search metadata, arXiv version history (only v1)
and [author's page](https://luochenzhao.github.io/) were checked again without
finding a correction. No source passage is reproduced in these deliverables.

## Baseline and supplier contracts

All original 26 Mathlib citations were read at
`082e2d37e8b0463410cdb532e111cd43d5a66174`, including their surrounding hypotheses.
The three added declarations were read at the same commit.

| Native input | What was checked |
|---|---|
| AbstractMeasure, dirac_apply | Existing continuous dual and literal Dirac evaluation; no invented norm/topology on measures |
| PadicInt.addChar_of_value_at_one and its continuity/value-at-one lemmas | Complete ultrametric Z_p-algebra, bounded scalar action, topological nilpotence |
| NormedSpace.exp | Native total series construction; convergence and derivative remain separate inputs |
| ofScalars, ofScalarsSum, HasFPowerSeriesAt | Native multilinear-series representation, tsum evaluation and positive-radius expansion |
| AnalyticAt.div, analyticOrderAt_eq_natCast | Nonzero denominator and the precise analytic normal form |
| MeromorphicAt.div, meromorphicOrderAt_eq_int_iff | Quotient germs and punctured integer-order normal form |
| HasDerivAt | Native derivative over a nontrivially normed field |
| DirichletCharacter.IsPrimitive | Actual conductor equals level |
| Ideal.span, local-ring nonunit lemma | Existing principal ideals and the unit 1−a argument applied to −ta |
| PadicInt.toZMod, denseRange_natCast | First residue digit and native density |
| Equiv, Nat.Coprime.dvd_mul_right | Existing equivalence and exact coprime divisibility implication |
| MulChar.sum_eq_zero_of_ne_one | Finite nontrivial character into a domain, with χ≠1 |
| PowerSeries.coeff, C, log; IsPrimitiveRoot | Native coefficient/constant maps, formal log coefficients and exact root-order predicate |
| primitiveCharacter, changeLevel_primitiveCharacter | Actual inducing character and level recovery, Basic.lean:307/310 |
| LFunction_changeLevel | Exact Euler product and exceptional-point hypothesis, DirichletContinuation.lean:150 |

Direct supplier statements were checked in the L0/L1/L2/predecessor L3 packets,
ColemanIntegration and LocallyAnalyticDistributions, and the PMIA packet.
The requests match the scopes of PMIA L0a/L2/L3, LAD L1 and
IntegralIwasawaTheory L0/L4; the latter two L-stages coexist with the I-stages
in its current reader. No absent whole packet was treated as an implementation.
In particular, the primitive-only pseudomeasure interpolation and the
product-level tame interpolation have different hypotheses, now respected.

The reviewed AUDIT-24 marks L3 not built. Searches of the current Tau Ceti and
current upstream Suggested files found no actual Gamma/Gross–Koblitz/Dirichlet
branch that this pass replans. Current Tau Ceti **does** contain inputs for the
standard chart: `TauCeti.padicIntUnitsEquivProd` and its component formulas,
`neg_mem_unitsPrincipal_two_two_iff`, and
`topologicalClosure_zpowers_eq_unitsPrincipal`. Their statements were read at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The request now says to reuse these
and asks for the remaining additive-coordinate/bundling comparisons.
UnitsDecomposition.lean is absent at the pinned Tau Ceti `f790474`; the current
observations are therefore recorded in upstreamNotes, not falsely cited as
pinned baseline declarations. Current ProfiniteArithmetic also reuses Tau
Ceti's p-adic powering; no new powering carrier is requested here.

## Red-team findings, closure and validation

**RT-AREA-iwasawa-2/1:** the existing owner supplies Morita Gamma, its signed
natural interpolation and both recurrences. The new root-ideal argument really
transfers `(ζ−1)^2` congruence to `π^2` congruence. GK1979 assumes odd p; the
`ζ=−1,π=−2` dyadic normalization is checked directly and does not pretend that
GK1979 proves the dyadic comparison. The Robert/Dwork inputs and excluded
endpoint remain visible.

**RT-AREA-iwasawa-2/2:** Zhao §1.2 fixes an arbitrary prime, and Theorem 4.1,
equations (4.4)–(4.6), pp.472–473, do not impose odd p. The finite permutation,
count/carry computation and Gamma recurrences work at p=2 with the sign modulo 4
convention and the dyadic logarithmic bound. This supports the stated all-prime
derivative formula, with its correction term. The original Ferrero–Greenberg
odd-prime proposition is not presented as its dyadic source. Nonvanishing
remains separate: Gross–Dasgupta's citation of Brumer does not supply the missing
arithmetic nonzero character projection. The packet preserves that exact gap.

All nine definitions have promoted APIs and at least three tests; the new total
is 32. The five new planets name central constructions/theorems and do not
replace the predecessor's planet. Supplier ownership, actual versus generic
charts, admissible character evaluation, native log ownership and all five
recorded gaps were checked. No stage is closed and no missing interface is
represented by a replacement proposition field.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/DirichletPadicLFunctions--L3-2.json --json`: zero errors and warnings.
- `lean-check research/blueprint/suggested/DirichletPadicLFunctions--L3-2.lean`:
  elaborates at the pinned Mathlib with **111 `sorry` warnings**, no errors or
  other warnings. These are signature/test placeholders, not proofs.
- Independent exact finite arithmetic checks: 67 small permutation cases
  checked range, unit preservation, bijection, congruence and every filtration
  threshold; 18 rational odd-character carry cases checked both identities,
  including p=2. These corroborate the source reading; they do not replace it.

## Assembly handoff

The issue permits changes only to the packet, suggested file, report and
handoff. Its reader is outside that allowlist. When the reader is regenerated
or assembled, apply these reviewed corrections there: line 21's measure-weight
sentence and line 608's proof must say `x ζ_eta=Res_U μ_eta`; the interpolation
ledger must include θ=1 and the conductor-one/conductor-change routes; the
Gamma-sum tests gain the quartic example; chart requests must reuse the current
Tau Ceti declarations; counts and elaboration date must reflect this review.
The corrected packet and this report are the explicit review amendments to
those older reader sentences. No other orchestrator decision is needed for
acceptance; the named mathematical gaps continue to the next planning pass.
