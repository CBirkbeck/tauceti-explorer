# M.5d source continuation — the prime-power diagram and its torsion boundary

**ChatGPT Pro — cgp-20260923-h7q4; 27 September 2026; Refs #959.**

**Partial, handoff-only checkpoint.** The packet, reader and suggested Lean file
are unchanged. Their eighteen nodes, six partial coverage records and six
source findings are not reclassified here. This supplement saves the detailed
prime-power proof contracts and tests for integration by the next continuation;
it is not a claim that new nodes have already been incorporated or compiled.
The entire preceding handoff is preserved verbatim below.

## P0. What the source actually proves

The source is Bloch–Kato, *p-adic étale cohomology*, Publications Mathématiques
IHÉS 63 (1986), Corollary 2.8 and proof, printed pp. 117–118:

- https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf
- https://www.numdam.org/item/10.1007/BF02831624.pdf

The page-117 image was freshly inspected, including both endpoint conventions
in its diagram; the page-118 continuation was read in parsed text. Its claim
for a field F of characteristic p is the isomorphism

    K_q^M(F)/p^r  ≅  H^0((Spec F)_et, W_r Ω^q_log),

and divisibility of the p-primary torsion subgroup of K_q^M(F). It does not
claim torsion-freeness in this corollary. The right side means actual global
sections of the logarithmic étale sheaf, not a group defined to be the image
of the desired field-valued symbol map.

Two deliberate features of the printed diagram matter. The top row has a
terminal zero but no initial zero. The bottom row has an initial zero but no
terminal zero. Neither missing endpoint may be installed as a hypothesis of
the induction. The argument below derives both of them.

This fresh read does not replace the earlier full §2 read, nor certify its
unfinished mod-p proof engines. The original Illusie I(5.7.5) remains unread:
both public copies located in this claim exceeded the browser PDF size limit,
and downloading to scratch failed. The exact-sequence input is therefore still
an explicitly attributed supplier obligation, not a newly checked proof of
Illusie's theorem. No fresh PDF byte hash is asserted. All historical hashes
and reading extents in the unchanged packet retain their original attribution.

## P1. The coefficient row and its actual left kernel

Let A be any abelian group and p a prime. Write C_r=A/p^r A, using the ordinary
additive quotient, not Quillen K-theory with coefficients. For r>=2 define

    i_r : C_1 -> C_r,       [a] |-> [p^(r-1) a],
    rho_r : C_r -> C_(r-1), [a] |-> [a].

The first map is well-defined because changing a by p b changes p^(r-1)a
by p^r b. The second is the canonical quotient reduction. They give the
right-exact sequence

    C_1 --i_r--> C_r --rho_r--> C_(r-1) -> 0.              (P1)

Indeed, rho_r is surjective. Its kernel consists precisely of classes having
a representative p^(r-1)b, which is the image of i_r. No torsion-freeness of A
was used. These maps and their quotient computations are application adapters
on the existing quotient carrier, not another theory of coefficient groups.

There is an explicit formula for the missing left endpoint. Put
A[p^m]={x in A : p^m x=0}. Then

    ker(i_r) = image(A[p^(r-1)] -> A/pA)
             = (A[p^(r-1)] + pA)/pA.                    (P2)

For a representative a, the equation i_r([a])=0 means
p^(r-1)a=p^r b for some b. Thus a-pb is killed by p^(r-1) and has the same
class as a modulo p. Conversely every such torsion representative is killed
by i_r. This proves (P2), including the representative-independence step.
Consequently i_r is injective exactly when A[p^(r-1)] is contained in pA.

The multiplier is p^(r-1), not p for every r. Already for A=Z, p=2 and r=3,
the proposed map [a] mod 2 |-> [2a] mod 8 is not well-defined: changing a by 2
changes its image by 4. The correct map sends the nonzero class to 4 mod 8.
At r=1 there is no induction step; C_1 is the base coefficient group.

## P2. The de Rham–Witt contracts belong to CR.4

For q>=0 and r>=1 put

    B_r(F,q)=H^0((Spec F)_et, W_r Ω^q_log).

This notation refers to the actual logarithmic subsheaf of the de Rham–Witt
complex. It is not a new carrier defined by K-theory. The generic construction
and operators are owned by `CrystallineCohomology:CR.4`; Milnor K-theory remains
with `K2SymbolsBrauer:T.2/milnor-k-theory`. Ordinary forms and inverse Cartier
remain with DD.2 and DD.3. The fresh CR.4 campaign read explicitly assigns the
Witt complex and R,F,V,d relations there. No other scoped stage is dropped.

Before the induction, CR.4 must supply these precise, noncircular inputs.

1. Construct the logarithmic sheaf with its additive structure and symbols
   dlog[a_1] ... dlog[a_q], using the Teichmüller lifts and the actual Witt
   product. Prove multilinearity, the Steinberg relation and p^r-annihilation
   so that the existing Milnor presentation gives a map
   h_r:C_r -> B_r(F,q). Its construction must not assume h_r is an isomorphism.
   Include the empty symbol at q=0, functoriality for field maps, and agreement
   of h_1 with the existing ordinary mod-p symbol and Cartier-kernel target.
2. Construct the canonical maps j_r:B_1 -> B_r and R_r:B_r -> B_(r-1) and
   prove the left-exact global-section sequence

       0 -> B_1 --j_r--> B_r --R_r--> B_(r-1).           (P3)

   The original logarithmic-sheaf exactness is the Illusie I(5.7.5) input cited
   by BK. Taking sections preserves its left and middle exactness. It does not
   by itself supply surjectivity of R_r on sections.
3. On the same symbol classes prove the two squares

       h_r i_r = j_r h_1,       R_r h_r = h_(r-1) rho_r. (P4)

   The second horizontal Witt map is restriction/truncation R, not Frobenius.
   The first has the symbol value

       j_r(dlog_1 symbol) = p^(r-1) dlog_r symbol.

   It is a map between different lengths, not multiplication by p^(r-1) on
   the already p-killed group B_1. Verify the operator formula from the actual
   Witt identities rather than identifying it with a guessed V or F formula.
4. Retain arbitrary fields: if the original geometric theorem is proved first
   for smooth algebras over a perfect field, provide its localization and
   filtered-colimit passage to F. In particular, logarithmic global sections
   and the old Cartier-kernel target must be identified, not merely given the
   same notation. Separately import the corresponding Milnor colimit adapter.

The modules in (P1)–(P4) are additive groups, or Z-modules. B_r is not generally
an F-vector space: at q=0 and r=2, its constant Z/p^2 subgroup is not killed
by p. Reusing the ordinary differential-form F-module for all lengths would
therefore give a false signature.

The Witt Steinberg proof also cannot copy an ordinary-form proof by assuming
[a]+[1-a]=1. Teichmüller lifts are multiplicative, not additive. In
W_2(F_3)=Z/9, [2]=8, so [2]+[2]=7 rather than [1]=1. One possible source-faithful
route is to prove the degree-two vanishing on the universal smooth punctured
line in CR.4 and then evaluate at a; that route still needs its Witt dimension
and pullback theorems. It is a proposal, not a proof claimed read in Illusie.

## P3. The induction derives, rather than assumes, both endpoints

Suppose the mod-p BGK theorem has actually been proved on the existing carrier,
so h_1 is bijective. Suppose by induction that h_(r-1) is bijective. Use (P1),
(P3), and (P4). The following argument is valid for arbitrary abelian groups.

First i_r is injective: if i_r(a)=0, then j_r h_1(a)=h_r i_r(a)=0.
Injectivity of j_r and h_1 gives a=0. This supplies the missing initial zero
in the coefficient row.

Next R_r is surjective, without first knowing that h_r is surjective. Given
z in B_(r-1), choose c in C_(r-1) with h_(r-1)(c)=z. Choose x in C_r with
rho_r(x)=c, using the surjection in the top row. Then R_r h_r(x)=z.
This supplies the missing terminal zero in the row of global sections.

Both rows are now short exact. The already-built five lemma gives bijectivity
of h_r. An explicit element check, useful for reviewing the interface, is:

- If h_r(x)=0, the right square and injectivity of h_(r-1) give rho_r(x)=0.
  Write x=i_r(a). The left square and injectivity of j_r h_1 give a=0.
- For y in B_r, lift R_r(y) through h_(r-1) and rho_r to x in C_r. Then
  y-h_r(x) is in ker(R_r)=image(j_r). Write it as j_r(b) and choose a with
  h_1(a)=b. The element x+i_r(a) maps to y.

This is the complete elementary induction step, conditional only on the
specified coefficient and Witt maps and the mod-p theorem. It is not a
completed proof of the missing BGK base case or the Witt-sheaf construction.

**Reuse, do not re-plan, generic diagram chasing.** At the pinned Mathlib
commit, `Mathlib/Algebra/FiveLemma.lean` already contains the literal theorem
`LinearMap.bijective_of_surjective_of_bijective_of_bijective_of_injective`,
and the injective/surjective four lemmas. Its context and proofs were read.
After deriving the two endpoints above, apply it over Z to the two rows with
zeros adjoined at both ends. The endpoint vertical maps are the unique maps
between zero modules, while the second and fourth are h_1 and h_(r-1).
No generic five-lemma node belongs in M.5d.

For a regression against the invalid H^0 shortcut, the prime-to-characteristic
Kummer sequence on (Spec F_3)_et is exact as a sequence of sheaves, but squaring
on its global unit group F_3^x misses 2. This is only a test of the global-section
inference; it does not substitute μ_p for logarithmic characteristic-p
coefficients.

## P4. The Tor step, with its multiplication map made explicit

The injectivity just established for every r proves divisibility of the
p-primary torsion T=A[p^infinity]. If x is killed by p^m with m>=1, its class
modulo p belongs to ker(i_(m+1)), hence is zero by (P2). Write x=p y.
Then p^(m+1)y=p^m x=0, so y belongs to T, not merely to A. Multiplication by p
on T is surjective.

For an integer ell prime to p and x killed by p^m, choose u,v with
u ell+v p^m=1. The element u x belongs to T and ell(u x)=x. Factoring any
positive integer as a power of p times an integer prime to p proves full
divisibility of T. Zero and the m=0 case are handled by the zero preimage.
No torsion-freeness hypothesis on A occurs.

This also identifies the exact Tor calculation in BK without making a new
Tor carrier. Using the usual resolution of Z/p^r, the map

    Tor_1^Z(A,Z/p^r)=A[p^r] -> A[p^(r-1)]

induced by coefficient reduction is **multiplication by p**, not the inclusion.
A lift of coefficient reduction is identity in resolution degree zero and
multiplication by p in degree one, since p^(r-1) p=p^r. The relevant exact
segment is

    A[p^r] --p--> A[p^(r-1)] --class mod p--> A/p
             --i_r--> A/p^r.                           (P5)

It can be checked without derived functors: if x in A[p^(r-1)] is p y, then
p^r y=0; conversely a p-multiple of an element killed by p^r lies in that
kernel. Formula (P2) identifies the next image and kernel. With the standard
resolution signs, the connecting map is reduction modulo p; changing that
sign does not alter the exactness or divisibility conclusion.

Keep this implication in the same direction. Do not assume divisibility to
make (P1) short exact before proving it from (P3)–(P4). That would remove
precisely the torsion information Corollary 2.8 establishes.

The pinned existing torsion carrier is `AddCommGroup.primaryComponent A p`,
generated by `to_additive` from `CommGroup.primaryComponent`. The definition
and its p-power-annihilation condition were read in
`Mathlib/GroupTheory/Torsion.lean`. A future literal-source declaration index
can cite the multiplicative source with this additive correspondence explicit;
it must not mistake a generated-name indexing omission for a missing carrier.

## P5. Boundary results and non-examples

**Divisibility is not vanishing.** In the Prüfer group P=Z[1/p]/Z, the class
of 1/p is nonzero and killed by p. Every class a/p^m has the p-division class
a/p^(m+1). Multiplication by every integer prime to p is invertible on each
finite p-power subgroup by the same Bezout argument. Thus P is a nonzero
divisible p-primary torsion group, while P/p^rP=0 for every r. All the
coefficient injections above hold vacuously for P. Therefore the coefficient
isomorphisms and their induction do not, by themselves, prove absence of
p-torsion in Milnor K-theory. The stronger Izhboldin theorem remains a separate
source and proof dependency, as in the preceding checkpoint.

**A finite window is insufficient.** For A=Z/p^m, the maps i_r are injective
for 1<=r<=m, but i_(m+1) is zero on the nonzero group A/p. Checking finitely
many prime powers cannot establish the all-r statement needed in P4.

**Perfect fields give a separate positive-degree check at all lengths.**
For perfect F and q>0, every Milnor symbol is divisible by p^r by extracting a
p^r-th root of its first entry. Hence K_q^M(F)/p^r=0, using the existing Milnor
multilinearity rather than the general BGK theorem. Every étale field extension
of F is also perfect. Provided the basic CR.4 Teichmüller differential identities
and p^r-annihilation are constructed, every logarithmic symbol of length r is
zero there: dlog[b^(p^r)]=p^r dlog[b]=0. Étale-local generation therefore makes
the positive-degree logarithmic sheaf zero and its global sections zero.
This is a noncircular boundary check, not a proof of the general Witt sequence.
Degree zero is different: the empty logarithmic symbol gives Z/p^r, with the
ordinary coefficient injection and reduction. Do not apply the positive-degree
vanishing statement to q=0.

## P6. Integration instructions and remaining work

No new identifiers have been reserved or added to the packet by this claim.
When integrating, preserve its eighteen IDs and make the following a small
source-specific continuation, rather than duplicating the generic library.

- Add the prime-power logarithmic symbol comparison on the imported CR.4
  carrier, with its symbol formula, reduction compatibility and left-square
  formula (P4). The generic Milnor presentation and Witt-complex construction
  remain with their existing owners. Test the empty symbol, a Steinberg pair,
  product and restriction compatibility, and the nonadditive Teichmüller trap.
- Add the Corollary 2.8 prime-power theorem with proof P3. Record the unproved
  BGK base and the exact CR.4 inputs as explicit gaps until their proof
  decompositions exist. There must be no circular dependency on torsion
  divisibility or on a definition of B_r as the image of h_r.
- Add the Milnor p-primary divisibility consequence with the maps in P5,
  using the existing primary-component carrier. Keep the Prüfer and finite-depth
  examples as acceptance tests, and retain the separate stronger torsion theorem.
- Extend the existing perfect-field and degree-zero checks to all r with P5's
  proof and the actual CR.4 interfaces, not an opaque Witt stand-in. These
  statements do not need the general positive-degree BGK theorem.

The next source priority is still the original Illusie I(5.7.5) proof and the
Witt logarithmic construction, together with the Kato inputs to the mod-p BGK
engine. The present supplement resolves the elementary prime-power diagram
and torsion implication, not those geometric inputs. M.5c's different,
prime-to-characteristic Bockstein and inseparable-reduction argument is not
replaced by this proof. All M.6/M.6a/M.6b, M.7 and M.8 work in the previous
handoff remains. In particular, the determinant supplier stays at
PadicMeasuresIwasawaAlgebras:L5. Nothing here replans Selmer or regulator theory.

## P7. Fresh verification boundary

The arithmetic primary-source read is the bounded Corollary 2.8 passage
specified in P0. Other original-source reads and correction searches in the
preserved handoff remain historical. No new source error or review verdict
is asserted. The CR.4 campaign was read in full; the RS-08 roadmap ownership
and selected decisions and the AUDIT-30 introductory inventory were reread.
This is not a fresh exhaustive atlas, link-map or consolidated-library audit.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, the relevant actual
five/four-lemma statements and proofs were read in FiveLemma.lean (file blob
`f14af3448671a2cdaf9cecd9b91e9fd698bb8a6a`), and the primary-component definition
with its additive generation in Torsion.lean (file blob
`3965c8503da6964a757d63f69fa7ba7409efcec3`). Tau Ceti remains pinned at
`f790474821cf4256814db967cb154e7af3d0c369`. These are existing suppliers, not
newly implemented results. The previous packet's 23 baseline entries are
unchanged and are not represented as freshly re-audited.

The unchanged packet's blob is `e4958b45f196bb6d86a4af34b9ea92fb39126110`.
The previous handoff was reconstructed and verified against its exact blob
`9ca67b686f2ea12428c015dc5856cda9fe8c020d` before being appended verbatim.
No packet, reader or suggested-file edit is part of this checkpoint.
Consequently **there is no new Lean file or compilation**, and the previous
66-placeholder compilation does not certify the proposed continuation.
The blueprint checker, full declaration-index audit and earlier regression
suites were **not rerun locally**; automatic submission checks are separate.

The following standard-library program was executed. It passed 1,536 finite
coefficient/Tor cases, 250 complete small cyclic diagrams, 15 finite-depth
counterexamples, 4,827 Prüfer identities, and the displayed transition,
global-section and Witt-coefficient boundary checks. These are diagnostics
of the algebra and conventions, not a proof of BGK, Illusie's theorem or
infinite-group divisibility. The proofs of the latter elementary implications
are given above, without extrapolation from finitely many tests.

```python
"""Finite diagnostics for the proposed BK Corollary 2.8 decomposition.
These check coefficient maps and boundary examples, not BGK or de Rham-Witt geometry.
Only Python's standard library is used.
"""
from fractions import Fraction
from math import gcd

coefficient_cases = 0
for modulus in range(1, 97):
    for p in (2, 3, 5, 7):
        for r in range(2, 6):
            # For A=Z/N, A/p^s A has the canonical model Z/gcd(N,p^s).
            c1 = gcd(modulus, p)
            cr = gcd(modulus, p**r)
            cm = gcd(modulus, p**(r-1))
            inc = lambda x: p**(r-1)*x % cr
            red = lambda x: x % cm
            assert inc(c1) == 0  # Independence of representatives.
            assert {red(x) for x in range(cr)} == set(range(cm))
            assert {x for x in range(cr) if red(x) == 0} == {
                inc(x) for x in range(c1)
            }
            # ker(i_r)=(A[p^(r-1)]+pA)/pA.
            killed = {x for x in range(modulus) if p**(r-1)*x % modulus == 0}
            assert {x for x in range(c1) if inc(x) == 0} == {x % c1 for x in killed}
            # The map on Tor_1 induced by Z/p^r -> Z/p^(r-1) is multiplication by p.
            killed_next = {x for x in range(modulus) if p**r*x % modulus == 0}
            assert {p*x % modulus for x in killed_next} == {
                x for x in killed if x % c1 == 0
            }
            coefficient_cases += 1

# Exhaust all small cyclic diagrams in the stated ranges with the weak endpoint hypotheses.
# A/p=C_p, A/p^r=C_(p^r), A/p^(r-1)=C_(p^(r-1)) for A=Z.
diagrams = 0
for p, r in ((2, 2), (2, 3), (3, 2), (3, 3)):
    high, low = p**r, p**(r-1)
    for size in range(1, 41):
        for j in range(size):
            if p*j % size or len({j*x % size for x in range(p)}) != p:
                continue
            for rho in range(low):
                if size*rho % low:
                    continue
                if {x for x in range(size) if rho*x % low == 0} != {
                    j*x % size for x in range(p)
                }:
                    continue
                for mid in range(size):
                    if high*mid % size:
                        continue
                    for left in range(1, p):
                        if j*left % size != mid*low % size:
                            continue
                        right = rho*mid % low
                        if gcd(right, low) != 1:
                            continue
                        # The second square and the top surjection force bottom surjectivity.
                        assert {rho*x % low for x in range(size)} == set(range(low))
                        # The middle map is now bijective; this was not an input.
                        image = {mid*x % size for x in range(high)}
                        assert len(image) == high == size
                        diagrams += 1

# Any finite depth can hide a first failed coefficient injection.
windows = 0
for p in (2, 3, 5):
    for m in range(1, 6):
        size = p**m
        for r in range(1, m+1):
            target = gcd(size, p**r)
            assert len({p**(r-1)*x % target for x in range(p)}) == p
        assert len({p**m*x % size for x in range(p)}) == 1
        windows += 1

# The wrong general transition x -> p*x need not descend from A/p to A/p^r.
assert (2*2) % 8 != 0  # A=Z, p=2, r=3: changing x by 2 changes its alleged image.
assert (2**2*2) % 8 == 0  # The correct map uses p^(r-1).

# Prüfer p-group calculations in Q/Z, using exact rational numbers.
def mod_one(x: Fraction) -> Fraction:
    return x % 1

pruefer_cases = 0
for p in (2, 3, 5):
    assert mod_one(Fraction(1, p)) != 0
    assert mod_one(p*Fraction(1, p)) == 0
    for m in range(1, 7):
        den = p**m
        for a in range(min(den, 30)):
            x = Fraction(a, den)
            y = x/p
            assert mod_one(p*y-x) == 0
            assert mod_one(p**(m+1)*y) == 0
            pruefer_cases += 1
            for ell in range(1, 18):
                if gcd(ell, p) != 1:
                    continue
                z = Fraction(a*pow(ell, -1, den), den)
                assert mod_one(ell*z-x) == 0
                pruefer_cases += 1

# Exactness of étale sheaves does not, by itself, give right exactness on sections.
# Prime-to-characteristic Kummer example over F_3: squares miss the unit 2.
assert {a*a % 3 for a in (1, 2)} == {1}
assert 2 not in {a*a % 3 for a in (1, 2)}

# Witt degree zero has characteristic p^r, not p; it is not an F_p-module for r>1.
assert (3 * 1) % 9 == 3
# In W_2(F_3)=Z/9, the Teichmuller lift of 2 is -1=8.
# Although 2+2=1 in F_3, their lifts do not sum to 1.
assert pow(8, 3, 9) == 8
assert (8 + 8) % 9 != 1

print(f'{coefficient_cases} coefficient/Tor cases; {diagrams} exact diagrams; '
      f'{windows} finite-depth counterexamples; {pruefer_cases} Prüfer identities; '
      'transition, global-section and Witt-coefficient boundary checks passed.')
```

---

# Preserved previous handoff (historical claims)

# BP-MotivicEtaleKTheory--M.5d handoff

Worker: Codex — codex-7e92bd. Refs #959. Source-correction follow-up to
merged PR #3112. The first checkpoint had no
inherited packet, reader, suggested file, handoff or integrated decomposition.
Claim comment 5850041226 was confirmed by bot comment 5850042059; the whole
issue was reread after confirmation. No git commands were used.

## Completed in this checkpoint

The characteristic-p differential-symbol entrance has 18 nodes: 6
constructions, 1 definition, 10 lemmas and 1 theorem. There are 24 API items,
21 unit tests, 5 planets, 23 baseline references, 7 gaps, 3 supplier requests
and 6 proposed source findings. All six required coverage records are partial;
no whole stage or implementation is claimed complete.

The nodes construct dlog on units, tensor powers, the imported Milnor quotient,
and its reduction modulo p; establish the Steinberg relation, naturality and
products; define the Artin–Schreier operator and its kernel; and corestrict the
symbol to that kernel. The coefficient formula is promoted to its own lemma
because fixedness consumes it. The elementary checks are the bijective
weight-zero map, injectivity in weight one conditional on the explicit Cartier
supplier, and positive-degree vanishing of forms and mod-p Milnor groups over
perfect fields. The Milnor quotient is not replaced by an exterior algebra.

The reader gives the proof plans, API and tests for every new object. It pins
absolute forms, the empty wedge, the additive exact-form quotient, the
Frobenius scalar convention, and the sign relative to Bloch–Kato. It also gives
the precise unfinished BGK proof itinerary and keeps Quillen coefficient groups
and the Geisser–Levine theorem distinct from Milnor reduction modulo p.

## Inputs and ownership

Read all scoped stage descriptions and the owner README, all six reviewed
AUDIT-30 records (26 targets), the accepted RS-08 decisions involving this
roadmap, and all 147 extracted relevant link/stage-edge records. Previously
fully read upstream GrothendieckEulerForms and JacobianChallenge documents
were byte-verified unchanged. The immutable worker, protocol and upstream
instructions were verified and consulted. No whole-roadmap source-coverage
claim is made from that screen.

K2SymbolsBrauer:T.2/milnor-k-theory supplies the Milnor presentation. Its actual
statement and API were reread. Generic ordinary forms/differential/product
and pullback remain owned by DerivedDeRhamCohomology:DD.2; inverse Cartier and
its all-field extension belong to DD.3. Both requests name exact carriers and
identities. In particular ν and the exact subgroup are not F-submodules.

PadicMeasuresIwasawaAlgebras:L5 is the named M.8 determinant supplier. The
fresh-main guard found an update from 14 L3 nodes to 32 L2/L3 nodes. All 18
new L2 statements and the L5 coverage record were read; the new nodes concern
weighted measures, Mahler derivations and Amice moments, while L5 remains
not_read. The request was retained and the supplier snapshot refreshed. No
irrelevant L2/L3 node is cited as if it supplied determinants.

Open Mathlib PR and Zulip archive searches were made for dlog, Cartier, Milnor
and de Rham work. The relevant design lead is Joël Riou's Mathlib PR #18551,
head 5888c0081ba867ede5c60d3060f2d674d932b53c: the de Rham complex uses exterior
powers of KaehlerDifferential with a base-ring-linear differential. Its
differential signature, square-zero statement and complex carrier were read.
That direction is recorded in the DD.2 request, without importing an unpinned
PR. A broad Kaehler search was not exhaustively read; no exhaustive negative
claim about upstream PRs is made.

## Sources actually read

- Weibel's 29 August 2013 author K-book: III.7 differential-symbol construction,
  Lemma 7.7, Definition 7.7.1 and Theorem 7.7.2, printed 250–251 / PDF 258–259.
  The next PDF page was read as an Izhboldin lead; its proof is not fully read.
- Bloch–Kato, *p-adic étale cohomology*, published IHES 63 (1986): all of §2,
  printed 113–118 / PDF 8–13, with visual formula checks; reference page 152.
  No other section is claimed read.
- Kurihara–Fesenko, published GT Monographs 3 appendix: all A1–A2, printed
  31–41 / PDF 1–11; key formulas on 31, 33, 36, 37, 38 and 40 visually checked.
  E1–E3 retain the residue-degree, Cartier-arrow and partial-order findings.
  This follow-up adds E501 (missing additivity), E502 (symbol coefficient)
  and E504 (the full p-basis extension degree). The cited passages agree with
  arXiv math/0012134v1. These findings do not certify the supplementary proof.

URLs, versions, hashes and access dates are in the packet. A targeted
correction search and the arXiv version history found no existing
correction; novelty is unestablished and findings await independent review.
The publisher contents endpoint did not render, and the located author-hosted
PDF returned HTTP 406. No comprehensive check of those errata sources is
claimed. Kato 1982 §1, Kato 1980
local class field theory II §3.3 Lemma 13, and Illusie I(5.7.5) remain unread.
Extracted pages of other K-book sections were not counted as read.

## Exact continuation

1. Preserve these eighteen IDs. Discharge or refine DD.2/DD.3 requests on the
   existing carriers. Prove the absolute Z/F_p comparison, the additive de Rham
   quotient, Cartier naturality and ker(D)=F^p for arbitrary fields.
2. Acquire Kato 1982 §1 and decompose BGK surjectivity and the elimination
   input in BK equation (2.6). Do not assume the theorem as a single opaque
   proof premise. For the relative argument split the norm/trace compatibility,
   prime-to-p descent, adapted p-basis, lexicographic reduction and relative
   Cartier diagram into declarations.
3. Build BK Lemma 2.2 and the semilocal groups of (2.3), including tame residues
   in degree q−1, the unit presentation, specialization and its relative
   kernel. Prove the DVR realization and filtered-colimit passages actually
   used to reach arbitrary fields. The packet gives no proof of these yet.
4. Read Illusie's logarithmic de Rham–Witt exact sequence and decompose BK
   Corollary 2.8, retaining the initially only right-exact top row and the Tor
   step. Separately source the prime-to-characteristic Bockstein induction and
   its allowed inseparable reductions from M.5c.
5. Complete every remaining M.6/M.6a/M.6b filtration, layer comparison,
   exact-couple/convergence and rational-operations target; every M.7 étale
   descent, rigidity, comparison-range and real/2-primary correction target;
   and all M.8 arithmetic regulators, lattices, realizations, norm relations
   and Selmer/determinant applications. The coverage lists retain the exact
   work and named generic owners. No scoped stage was dropped by RS-08.

## Original checkpoint validation

The full suggested file compiled with Lean 4.34.0-rc2: zero errors, 66
warnings, all `declaration uses sorry` warnings. Its one Tau Ceti module was
freshly built from f790474; the 1,978 reached Mathlib source files were
byte-matched to 082e2d3. All eighteen node forms, twenty-four API entries and
twenty-one test examples are typed. Signature inspection specifically checked
that the characteristic hypotheses survived elaboration on modPSymbol,
forms_p_smul and perfect_modP_zero. Imported T.2/DD.2/DD.3 stand-ins are
labelled, and no Prop-valued stand-in asserts a missing theorem.

The unmodified blueprint checker with the pinned declaration index reports
zero errors and zero warnings. The internal graph has 28 edges and is acyclic.
Explicit supplier-node prerequisite traversal does not return to a new node;
this is not certification of every inherited atlas-wide stage edge. API/test
name agreement, six-stage scope, source hashes, all unchecked statuses and
absence of local paths were checked. No existing unrelated snapshot file was
modified except the read-only supplier refresh in scratch; publication contains
exactly the four authorized new deliverables.

Four-file intake: zero problems. Final publication guard matched all 50
captured input blobs after the reviewed supplier refresh at main
`2b7a9eaff6e45705f025d2e393ac1c6b2ea9f2ba`. All four outputs remained absent,
the issue body was unchanged, and bot confirmation 5850042059 still owned the claim.

## Source-correction follow-up

All eighteen node objects, twenty-four API items, twenty-one tests, twenty-three
baseline references, seven gaps, three supplier requests and six coverage
records are unchanged. The three inherited source findings retain their IDs
and full contents. The ordering and residue findings from the new source pass
were recognized as E3 and E1, so they were not duplicated. No review verdict
was added and no implementation or stage closure is claimed.

The suggested Lean file is byte-identical to the file compiled for PR #3112;
the SHA-256 is recorded in checks.sourceContinuation. That compilation had
zero errors and 66 proof-placeholder warnings. It was not repeated for this
source-only change. The packet, reader and handoff are the only changed files.

The blueprint checker with the pinned declaration index reports zero errors
and zero warnings; exact three-file intake reports zero problems. Fresh main
`6695352668f8c0d717c0e9636dce214fb0a285b1` matched all 51 captured input blobs
and all four output blobs. The issue body and latest own claim confirmation
5850042059 were unchanged; the job remained available and review #456 was
blocked and unclaimed. This is an own-job correction under WORKERS, not a
second claim or an independent review.
